public struct EmptyViewModifier: ViewModifier {
  public typealias Body = Never
  public static let identity: EmptyViewModifier = EmptyViewModifier()
  public init() {
    
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    body(_Graph(), inputs)
  }
}
