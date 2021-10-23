@usableFromInline
struct MultilineTextAlignmentKey: EnvironmentKey {
  @usableFromInline
  static var defaultValue: TextAlignment {
    .leading
  }
}

extension EnvironmentValues {
  @inlinable
  public var multilineTextAlignment: TextAlignment {
    get {
      self[MultilineTextAlignmentKey.self]
    }
    set {
      self[MultilineTextAlignmentKey.self] = newValue
    }
  }
}

extension View {
  @inlinable
  public func multilineTextAlignment(_ alignment: TextAlignment) -> ModifiedContent<Self, _EnvironmentKeyWritingModifier<TextAlignment>> {
    return environment(\.multilineTextAlignment, alignment)
  }
}
