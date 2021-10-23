import UIKit

public struct UIViewModifier: ViewModifier, _PassthroughViewModifier {
  public typealias Body = Never
  public let base: PassthroughViewModifier
  public init(base: PassthroughViewModifier) {
    self.base = base
  }
  public init<A: UIView, B>(
    _ keyPath: ReferenceWritableKeyPath<A, B>,
    _ newValue: B
  ) {
    base = .init(keyPath, newValue)
  }
  public init<A>(
    description: String,
    block: @escaping (A) -> Void
  ) {
    base = .init(description: description, block: block)
  }
  public static func `dynamic`(
    description: String,
    block: @escaping (UIView) -> Void
  ) -> UIViewModifier {
    UIViewModifier(description: description, block: block)
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier._modifyContent(modifier[\.base], inputs, body: body)
  }
}

public struct UIViewModifiedContent<Content: View>: View {
  public typealias Base = PassthroughModifiedContent<Content, UIViewModifier>
  public let base: Base
  public typealias Body = Never
  public init(content: Content, modifier: UIViewModifier) {
    base = .init(content: content, modifier: modifier)
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Base._makeView(view[\.base], inputs)
  }
}

extension View {
  public func cocoa(_ modifier: () -> UIViewModifier) -> UIViewModifiedContent<Self> {
    UIViewModifiedContent<Self>(content: self, modifier: modifier())
  }
}
