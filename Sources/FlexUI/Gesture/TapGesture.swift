public struct TapGesture: Gesture {
  public var count: Int
  public init(count: Int = 1) {
    self.count = count
  }
  public typealias Body = Never
  public typealias Value = ()
  public static func _makeGesture(gesture: _GraphValue<TapGesture>, inputs: _GestureInputs) -> _GestureOutputs<()> {
    let node = GestureNode(
      name: "TapGesture",
      valueType: Never.self
    ) {
      let target = _Target { _ in }
      let g = _TapGesture(target: target, action: #selector(_Target._didReceiveEvent(sender:)))
      g._target = target
      g.numberOfTapsRequired = gesture.value.count
      return g
    }
    return _GestureOutputs<()>().then {
      $0.nodes = [node]
    }
  }
}
