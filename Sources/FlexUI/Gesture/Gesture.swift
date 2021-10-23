public protocol Gesture {
  associatedtype Value
  static func _makeGesture(gesture: _GraphValue<Self>, inputs: _GestureInputs) -> _GestureOutputs<Self.Value>
  associatedtype Body: Gesture
  var body: Self.Body { get }
}
extension Gesture where Body == Never {
  public var body: Body {
    fatalError()
  }
}
extension Never : Gesture {
  public typealias Value = Never
}
extension Gesture where Self.Value == Self.Body.Value {
  public static func _makeGesture(gesture: _GraphValue<Self>, inputs: _GestureInputs) -> _GestureOutputs<Self.Body.Value> {
    Body._makeGesture(gesture: gesture[\.body], inputs: inputs)
  }
}
