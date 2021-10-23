public struct ModifiedContent<Content, Modifier> {
  public var content: Content
  public var modifier: Modifier
  public typealias Body = Never
  public init(content: Content, modifier: Modifier) {
    self.content = content
    self.modifier = modifier
  }
}

extension ModifiedContent: View where Content: View, Modifier: ViewModifier {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Modifier._modifyContent(view[\.modifier], inputs) { (_, inputs) in
      Content._makeView(view[\.content], inputs)
    }
  }
}

extension ModifiedContent: ViewModifier where Content: ViewModifier, Modifier: ViewModifier {
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    Modifier._modifyContent(modifier[\.modifier], inputs) { (graph, inputs) in
      Content._modifyContent(modifier[\.content], inputs, body: body)
    }
  }
}
