public struct _EnvironmentKeyWritingModifier<Value> : ViewModifier {
  public var keyPath: WritableKeyPath<EnvironmentValues, Value>
  public var value: Value
  @inlinable public init(keyPath: WritableKeyPath<EnvironmentValues, Value>, value: Value) {
    self.keyPath = keyPath
    self.value = value
  }
  public typealias Body = Never
  public static func _modifyContent(
    _ modifier: _GraphValue<Self>,
    _ inputs: _ViewInputs,
    body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
  ) -> _ViewOutputs {
    return body(
      _Graph(),
      inputs.then {
        $0.environment[keyPath: modifier.value.keyPath] = modifier.value.value
      }
    )
  }
}

extension View {
  @inlinable
  public func environment<V>(
    _ keyPath: WritableKeyPath<EnvironmentValues, V>,
    _ value: V
  ) -> ModifiedContent<Self, _EnvironmentKeyWritingModifier<V>> {
    modifier(_EnvironmentKeyWritingModifier(keyPath: keyPath, value: value))
  }
}
