public struct Font: Equatable, Hashable {
  public struct Weight: Hashable, Equatable, RawRepresentable {
    public var rawValue: Double
    public init(_ rawValue: Double) {
      self.rawValue = rawValue
    }
    public init(rawValue: Double) {
      self.rawValue = rawValue
    }
  }
  public typealias Provider = NativeValue
  let provider: Provider
  public init(provider: Provider) {
    self.provider = provider
  }
}
