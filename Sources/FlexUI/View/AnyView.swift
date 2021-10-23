public struct AnyView {
  private let block: (_GraphValue<Self>, _ViewInputs) -> _ViewOutputs
  public typealias Body = Never
  public init<Content: View>(view: Content) {
    block = {
      Content._makeView($0.branch(view), $1)
    }
  }
}

extension AnyView: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    view.value.block(view, inputs)
  }
}
