 public enum Axis : Swift.Int8, Swift.CaseIterable {
  case horizontal
  case vertical
  public struct Set: Swift.OptionSet {
    public typealias RawValue = Swift.Int8
    public let rawValue: Swift.Int8
    public init(rawValue: Swift.Int8) {
      self.rawValue = rawValue
    }
    public static let horizontal: Axis.Set = Axis.Set(rawValue: 1 << 0)
    public static let vertical: Axis.Set = Axis.Set(rawValue: 1 << 1)
  }
}
