internal func modify<A: AnyObject, B>(_ keyPath: ReferenceWritableKeyPath<A, B>, _ newValue: B) -> (A) -> Void {
  return {
    $0[keyPath: keyPath] = newValue
  }
}

public struct PassthroughViewModifier<A: AnyObject>: ViewModifier {
  public typealias Body = Never
  public let description: String
  public let transform: (UIView) -> A?
  public let block: (A) -> Void
  internal init(
    description: String,
    transform: @escaping (UIView) -> A?,
    block: @escaping (A) -> Void
  ) {
    self.description = description
    self.transform = transform
    self.block = block
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    var contents = body(_Graph(), inputs)
    contents.nodes.indices.forEach { index in
      contents.nodes[index].modify { (v, values) in
        modifier.value.transform(v).map(modifier.value.block)
      }
    }
    return contents
  }
}

extension PassthroughViewModifier where A: UIView {
  public init(
    description: String,
    block: @escaping (A) -> Void
  ) {
    self.init(
      description: description,
      transform: { $0 as? A },
      block: block
    )
  }
  public init<B>(
    _ keyPath: ReferenceWritableKeyPath<A, B>,
    _ newValue: B
  ) {
    self.init(
      description: "PassthroughViewModifier: \(keyPath._kvcKeyPathString ?? "") \(newValue)",
      block: modify(keyPath, newValue)
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
