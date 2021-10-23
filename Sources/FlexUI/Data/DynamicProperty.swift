public protocol DynamicProperty {
  static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs)
  mutating func update()
}

extension DynamicProperty {
  public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {

  }
  public mutating func update() {
    
  }
}
