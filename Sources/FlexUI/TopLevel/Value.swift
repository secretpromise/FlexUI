import RxSwift

internal protocol Values {
  
}

extension Values {
  internal func then(_ block: (inout Self) -> Void) -> Self {
    var copy = self
    block(&copy)
    return copy
  }
}

class PropertyStorage {
  var properties: [String: Any] = [:]
}

class Context {
  var storages: [String: PropertyStorage] = [:]
}

public struct _ViewInputs: Values {
  internal var environment: EnvironmentValues
  internal var context: Context
  internal init(
    environment: EnvironmentValues,
    context: Context
  ) {
    self.environment = environment
    self.context = context
  }
}

public struct _ViewOutputs: Values {
  internal var nodes: [ViewNode] = []
  internal var observation: [Observable<()>] = []
  internal init() {
    
  }
}

public struct _GestureInputs: Values {
  internal var environment: EnvironmentValues = EnvironmentValues()
  internal init() {
    
  }
}

public struct _GestureOutputs<Value>: Values {
  internal var nodes: [GestureNode] = []
  internal init() {
    
  }
}

public struct _DynamicPropertyBuffer {
  
}

public struct _GraphInputs {
  
}

public struct _Graph {
  init() {
    
  }
}

public struct _GraphValue<Value>: Equatable {
  internal var value: Value
  internal var paths: [String]
  internal var parent: Any?
  internal init(
    value: Value,
    paths: [String],
    parent: Any? = nil
  ) {
    self.value = value
    self.paths = paths
    self.parent = parent
  }
  public subscript<U>(keyPath: KeyPath<Value, U>) -> _GraphValue<U> {
    _GraphValue<U>(value: value[keyPath: keyPath], paths: paths + ["\(U.self)"], parent: self)
  }
  public static func == (lhs: _GraphValue<Value>, rhs: _GraphValue<Value>) -> Bool {
    ("\(lhs.value)", lhs.paths) == ("\(rhs.value)", rhs.paths)
  }
  public func branch<O>(_ value: O, _ paths: [String] = ["\(O.self)"]) -> _GraphValue<O> {
    _GraphValue<O>(value: value, paths: self.paths + paths, parent: self)
  }
}
