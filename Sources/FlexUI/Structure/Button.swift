public struct Button {
  public typealias Body = Never
  internal let action: () -> Void
  public init(action: @escaping () -> Void) {
    self.action = action
  }
}
