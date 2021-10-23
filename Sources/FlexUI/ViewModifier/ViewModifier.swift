public struct _ViewModifier_Content<Modifier: ViewModifier>: View {
  public typealias Body = Never
  internal var outputs: _ViewOutputs
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    view.value.outputs
  }
}

public protocol ViewModifier {
  associatedtype Body: View
  typealias Content = _ViewModifier_Content<Self>
  func body(content: Content) -> Body
  static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
}

extension View {
  @inlinable
  public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
    return ModifiedContent(content: self, modifier: modifier)
  }
}

extension ViewModifier {
  @inlinable
  public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
    return ModifiedContent(content: self, modifier: modifier)
  }
}

extension ViewModifier {
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    let contents = body(_Graph(), inputs)
    let bodies = Body._makeView(modifier.branch(modifier.value.body(content: .init(outputs: contents))), inputs)
    return bodies
  }
}

extension ViewModifier where Self.Body == Never {
  public func body(content: Content) -> Body {
    fatalError()
  }
}
