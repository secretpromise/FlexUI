public protocol PrimitiveButtonStyle {
  associatedtype Body: View
  @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
  typealias Configuration = PrimitiveButtonStyleConfiguration
}
public struct PrimitiveButtonStyleConfiguration {
  public struct Label : View {
    public typealias Body = Never
  }
  public let role: ButtonRole?
  public let label: Label
  public func trigger() {
    
  }
}
extension View {
  public func buttonStyle<S>(_ style: S) -> ModifiedContent<Self, PrimitiveButtonStyleModifier<S>> where S : PrimitiveButtonStyle {
    modifier(PrimitiveButtonStyleModifier(style: style))
  }
}
