public struct PassthroughViewModifier: ViewModifier {
  public typealias Body = Never
  public let description: String
  public var blocks: [(UIView) -> Void]
  internal init<A>(
    description: String,
    transform: @escaping (UIView) -> A?,
    block: @escaping (A) -> Void
  ) {
    self.description = description
    self.blocks = [{
      _ = transform($0).map(block)
    }]
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    var contents = body(_Graph(), inputs)
    contents.nodes.indices.forEach { index in
      contents.nodes[index].modify { (v, values) in
        modifier.value.blocks.forEach {
          $0(v)
        }
      }
    }
    return contents
  }
  public func merge(_ other: PassthroughViewModifier) -> PassthroughViewModifier {
    var copy = self
    copy.blocks.append(contentsOf: other.blocks)
    return copy
  }
}

extension PassthroughViewModifier {
  public init<A>(
    description: String,
    block: @escaping (A) -> Void
  ) {
    self.init(
      description: description,
      transform: { $0 as? A },
      block: block
    )
  }
  public init<A: AnyObject, B>(
    _ keyPath: ReferenceWritableKeyPath<A, B>,
    _ newValue: B
  ) {
    self = PassthroughViewModifier(
      description: "PassthroughViewModifier: \(keyPath._kvcKeyPathString ?? "") \(newValue)",
      block: {
        $0[keyPath: keyPath] = newValue
      } as (A) -> Void
    )
  }
}

public struct PassthroughModifiedContent<Content: View, Modifier: ViewModifier>: View {
  public var content: Content
  public var modifier: Modifier
  public typealias Body = Never
  public init(content: Content, modifier: Modifier) {
    self.content = content
    self.modifier = modifier
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    ModifiedContent<Content, Modifier>._makeView(view.branch(.init(content: view.value.content, modifier: view.value.modifier)), inputs)
  }
}

protocol _PassthroughViewModifier {
  var base: PassthroughViewModifier { get }
  init(base: PassthroughViewModifier)
}

extension _PassthroughViewModifier {
  public func merge(_ other: Self) -> Self {
    Self(base: base.merge(other.base))
  }
}
