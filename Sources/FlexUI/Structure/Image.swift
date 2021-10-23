public struct Image: Equatable, Hashable {
  public typealias Body = Never
  public typealias Provider = Image.NativeValue
  internal var provider: Provider
  public init(provider: Provider) {
    self.provider = provider
  }
  public static func == (lhs: Image, rhs: Image) -> Bool {
    lhs.provider == rhs.provider
  }
  public func hash(into hasher: inout Hasher) {
    hasher.combine(provider)
  }
}
