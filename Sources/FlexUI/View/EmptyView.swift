public struct EmptyView {
  public typealias Body = Never
  public init() {
    
  }
}

extension EmptyView: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    _ViewOutputs()
  }
}
