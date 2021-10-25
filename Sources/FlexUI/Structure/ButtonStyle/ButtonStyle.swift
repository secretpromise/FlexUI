public protocol ButtonStyle {
  associatedtype Body : View
  @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
  typealias Configuration = ButtonStyleConfiguration
}

public struct ButtonStyleConfiguration {
  public struct Label: View {
    public typealias Body = Never
  }
  public let role: ButtonRole?
  public let label: Label
  public let isPressed: Bool
}

extension View {
  public func buttonStyle<S : ButtonStyle>(_ style: S) -> ModifiedContent<Self, ButtonStyleModifier<S>> {
    modifier(ButtonStyleModifier(style: style))
  }
}
