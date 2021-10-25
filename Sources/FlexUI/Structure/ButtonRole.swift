public struct ButtonRole : Equatable {
  public static let destructive: ButtonRole = ButtonRole(rawValue: 1 << 1)
  public static let cancel: ButtonRole = ButtonRole(rawValue: 1 << 2)
  internal var rawValue: Int
  internal init(rawValue: Int) {
    self.rawValue = rawValue
  }
  public static func == (lhs: ButtonRole, rhs: ButtonRole) -> Bool {
    lhs.rawValue == rhs.rawValue
  }
}
