@usableFromInline
struct LineLimitKey: EnvironmentKey {
  @usableFromInline
  static var defaultValue: Int? {
    nil
  }
}

extension EnvironmentValues {
  @inlinable
  public var lineLimit: Int? {
    get {
      self[LineLimitKey.self]
    }
    set {
      self[LineLimitKey.self] = newValue
    }
  }
}

extension View {
  @inlinable
  public func lineLimit(_ number: Int?) -> ModifiedContent<Self, _EnvironmentKeyWritingModifier<Int?>> {
    return environment(\.lineLimit, number)
  }
}
