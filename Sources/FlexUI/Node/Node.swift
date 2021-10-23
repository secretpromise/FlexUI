import Foundation

enum Nodes {
  static func transfer<Instance: AnyObject>(from lhs: Node<Instance>, to rhs: inout Node<Instance>) {
    rhs.reusableInstance = rhs.reusableInstance ?? lhs.reusableInstance
    guard !lhs.children.isEmpty else {
      return
    }
    rhs.updateChildren {
      recursiveTransferChildren(from: lhs.children, to: &$0)
    }
  }
  static func recursiveTransferChildren<Instance: AnyObject>(from lhs: [Node<Instance>], to rhs: inout [Node<Instance>]) {
    precondition(lhs.count == rhs.count)
    (0..<lhs.count).forEach { index in
      transfer(from: lhs[index], to: &rhs[index])
    }
  }
  static func hasSameHierarchy<Instance: AnyObject>(_ lhs: Node<Instance>, _ rhs: Node<Instance>) -> Bool {
    (lhs.name == rhs.name) &&
      lhs.children.count == rhs.children.count &&
      zip(lhs.children, rhs.children).allSatisfy({ hasSameHierarchy($0.0, $0.1) })
  }
}

struct Node<Instance: AnyObject> {
  private(set) var children: [Node<Instance>] = []
  fileprivate var reusableInstance: Instance?
  private(set) var name: String = ""
  private(set) var values: AnyEquatable?
  private var createInstanceCallback: () -> Instance
  private var updateInstanceCallbacks: [(Instance, Any?) -> Void]
  private(set) var transformInstanceCallback: ((Instance) -> Instance)?
  private(set) var isDirty: Bool = false
  init<Value: Equatable>(
    name: String,
    valueType: Value.Type,
    values: Value?,
    create: @escaping (() -> Instance),
    transform: ((Instance) -> Instance)? = nil,
    update: ((Instance, Value) -> Void)?
  ) {
    self.name = name
    self.createInstanceCallback = create
    self.transformInstanceCallback = transform
    if Value.self != Never.self {
      self.updateInstanceCallbacks = [{ update?($0, $1 as! Value) }]
      self.values = values.map(AnyEquatable.init(value:))
    } else {
      self.updateInstanceCallbacks = []
      self.values = nil
    }
  }
  init<Value: Equatable>(
    name: String,
    values: Value,
    create: @escaping (() -> Instance),
    transform: ((Instance) -> Instance)? = nil,
    update: @escaping (Instance, Value) -> Void
  ) {
    self.init(
      name: name,
      valueType: Value.self,
      values: values,
      create: create,
      transform: transform,
      update: update
    )
  }
  init<Value: Equatable>(
    name: String,
    valueType: Value.Type,
    create: @escaping (() -> Instance),
    transform: ((Instance) -> Instance)? = nil
  ) {
    self.init(
      name: name,
      valueType: valueType,
      values: nil,
      create: create,
      transform: transform,
      update: nil
    )
  }
  mutating func modify(_ body: @escaping (Instance, Any?) -> Void) {
    updateInstanceCallbacks.append(body)
  }
  mutating func updateInstanceIfNeeded() {
    guard let instance = reusableInstance else {
      return
    }
    let value = values?.base
    updateInstanceCallbacks.forEach { body in
      body(instance, value)
    }
  }
  mutating func markDirty() {
    isDirty = true
  }
  mutating private func _mapChildren<T>(_ block: (inout [Node<Instance>]) -> T, callBack: (T) -> Void) {
    let oldValue = self
    var newValue = self
    var result: Any?
    if T.self == Void.self {
      _ = block(&newValue.children)
    } else {
      result = block(&newValue.children)
    }
    if Nodes.hasSameHierarchy(oldValue, newValue) {
      if oldValue != newValue {
        Nodes.transfer(from: oldValue, to: &newValue)
      }
    }
    self = newValue
    if T.self == Void.self {
      callBack(() as! T)
    } else {
      callBack(result! as! T)
    }
  }
  mutating func updateChildren(_ block: (inout [Node<Instance>]) -> Void) {
    _mapChildren(block, callBack: { _ in })
  }
  mutating func mapChildren<T>(_ block: (inout [Node<Instance>]) -> T) -> T {
    var result: T?
    _mapChildren(block, callBack: { result = $0 })
    return result!
  }
  mutating func makeInstance() -> Instance {
    let view = reusableInstance ?? createInstanceCallback()
    if reusableInstance !== view {
      reusableInstance = view
    }
    return view
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    lhs.reusableInstance === rhs.reusableInstance && (lhs.name, lhs.values, lhs.children) == (rhs.name, rhs.values, rhs.children)
  }
}

/// DEBUG
extension Node {
  private func makeNodeDescription() -> NodeDescription {
    var node = NodeDescription(name: self.name)
    node.children = children.map({ $0.makeNodeDescription() })
    return node
  }
  func tree() -> String {
    makeNodeDescription().description
  }
}

struct NodeDescription: CustomStringConvertible {
  struct Feature: OptionSet {
    let rawValue: Int
    static let isRoot =       Feature(rawValue: 1 << 0)
    static let isLeaf =       Feature(rawValue: 1 << 1)
    static let isFirst =      Feature(rawValue: 1 << 3)
    static let isLast =       Feature(rawValue: 1 << 4)
  }
  var name: String
  var children: [NodeDescription] = []
  private func _tree(indent: Int, features: Feature, environment: [Int]) -> String {
    var environment0 = environment
    let children = self.children
    let prefix: String
    if features.contains(.isRoot) {
      prefix = ""
    } else if features.contains(.isLeaf) {
      if features.contains(.isLast) {
        prefix = "└─"
      } else {
        prefix = "├─"
      }
    } else {
      if features.contains(.isLast) {
        prefix = "└┬"
        if !environment0.isEmpty {
          environment0.removeLast()
        }
      } else {
        prefix = "├┬"
      }
      environment0.append(indent + 1)
    }
    var currentValue = "\(String(repeating: " ", count: indent))\(prefix)\(name)"
    environment.forEach { offset in
      guard offset != indent else {
        return
      }
      currentValue.replaceSubrange(
        currentValue.index(currentValue.startIndex, offsetBy: offset)..<currentValue.index(currentValue.startIndex, offsetBy: offset + 1),
        with: "│"
      )
    }
    if children.isEmpty {
      return currentValue
    }
    let count = children.count
    var strings: [String] = children.enumerated().map({
      let (offset, node) = $0
      let features0: Feature = [offset == 0 ? .isFirst : [], offset == count - 1 ? .isLast : [], node.children.isEmpty ? .isLeaf : []]
      return node._tree(indent: indent + 1, features: features0, environment: environment0)
    })
    strings.insert(currentValue, at: 0)
    return strings.joined(separator: "\n")
  }
  var description: String {
    _tree(indent: 0, features: [.isRoot, children.isEmpty ? .isLeaf : []], environment: [])
  }
}
