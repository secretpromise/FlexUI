public struct PrimitiveButtonStyleModifier<S: PrimitiveButtonStyle>: ViewModifier {
  public typealias Body = Never
  public let style: S
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    body(_Graph(), inputs)
  }
}
