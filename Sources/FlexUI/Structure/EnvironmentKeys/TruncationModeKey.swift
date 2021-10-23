@usableFromInline
struct TruncationModeKey: EnvironmentKey {
  @usableFromInline
  static var defaultValue: Text.TruncationMode {
    .tail
  }
}

extension EnvironmentValues {
  @inlinable
  public var truncationMode: Text.TruncationMode {
    get {
      self[TruncationModeKey.self]
    }
    set {
      self[TruncationModeKey.self] = newValue
    }
  }
}

extension View {
  @inlinable
  public func truncationMode(_ mode: Text.TruncationMode) -> ModifiedContent<Self, _EnvironmentKeyWritingModifier<Text.TruncationMode>> {
    return environment(\.truncationMode, mode)
  }
}
