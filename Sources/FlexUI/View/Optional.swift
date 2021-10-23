extension Optional: View where Wrapped: View {
  public typealias Body = Never
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    view.value.map {
      Wrapped._makeView(view.branch($0), inputs)
    } ?? _ViewOutputs()
  }
}
