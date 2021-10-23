public protocol EnvironmentKey {
  associatedtype Value
  static var defaultValue: Self.Value { get }
}
