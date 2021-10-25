import UIKit
import YogaKit

public struct YogaLayoutModifier: ViewModifier, _PassthroughViewModifier {
  public typealias Body = Never
  public let base: PassthroughViewModifier
  public init(base: PassthroughViewModifier) {
    self.base = base
  }
  public init<V>(_ keyPath: ReferenceWritableKeyPath<YGLayout, V>, _ newValue: V) {
    base = .init(
      description: "YogaLayoutModifier: \(keyPath._kvcKeyPathString ?? "") \(newValue)",
      transform: { $0.yoga },
      block: {
        $0[keyPath: keyPath] = newValue
      }
    )
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier._modifyContent(modifier[\.base], inputs, body: body)
  }
}

public struct YogaModifiedContent<Content: View>: View {
  public typealias Base = PassthroughModifiedContent<Content, YogaLayoutModifier>
  public let base: Base
  public typealias Body = Never
  public init(content: Content, modifier: YogaLayoutModifier) {
    base = .init(content: content, modifier: modifier)
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Base._makeView(view[\.base], inputs)
  }
}

extension View {
  public func yoga(_ modifier: () -> YogaLayoutModifier) -> YogaModifiedContent<Self> {
    YogaModifiedContent<Self>(content: self, modifier: modifier())
  }
}
