public struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation {
  internal var key: String
  internal var hasFormatting: Bool = false
  private var arguments: [LocalizedStringKey.FormatArgument] = []
  public init(_ value: String) {
    self.key = value
  }
  public init(stringLiteral value: String) {
    self.key = value
  }
  public init(stringInterpolation: LocalizedStringKey.StringInterpolation) {
    self.key = stringInterpolation.value
  }
  internal struct FormatArgument : Equatable {

  }
  public struct StringInterpolation : StringInterpolationProtocol {
    var value: String
    public init(literalCapacity: Int, interpolationCount: Int) {
      self.value = ""
    }
    public mutating func appendLiteral(_ literal: String) {
      self.value.append(contentsOf: literal)
    }
    public mutating func appendInterpolation(_ string: String) {
      self.value.append(contentsOf: string)
    }
    public typealias StringLiteralType = String
  }
  public typealias ExtendedGraphemeClusterLiteralType = String
  public typealias StringLiteralType = String
  public typealias UnicodeScalarLiteralType = String
}
