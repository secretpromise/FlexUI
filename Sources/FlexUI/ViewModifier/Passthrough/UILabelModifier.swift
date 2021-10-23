import UIKit
import YogaKit

public struct NativeTextModifier: ViewModifier {
  public typealias Body = Never
  public let base: PassthroughViewModifier<UILabel>
  public init<B>(
    _ keyPath: ReferenceWritableKeyPath<UILabel, B>,
    _ newValue: B
  ) {
    base = .init(keyPath, newValue)
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier<UILabel>._modifyContent(modifier[\.base], inputs, body: body)
  }
}

public struct NativeTextModifiedContent<Content: View>: View {
  public typealias Base = PassthroughModifiedContent<Content, NativeTextModifier>
  public let base: Base
  public typealias Body = Never
  public init(content: Content, modifier: NativeTextModifier) {
    base = .init(content: content, modifier: modifier)
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs)
    -> _ViewOutputs
  {
    Base._makeView(view[\.base], inputs)
  }
}

extension View {
  public func modifier(_ modifier: NativeTextModifier) -> NativeTextModifiedContent<Self> {
    NativeTextModifiedContent<Self>(content: self, modifier: modifier)
  }
}

extension NativeTextModifier {
  public static func numberOfLines(_ numberOfLines: Int) -> NativeTextModifier {
    NativeTextModifier(\.numberOfLines, numberOfLines)
  }
}

extension View {
  public func numberOfLines(_ numberOfLines: Int) -> NativeTextModifiedContent<Self> {
    modifier(NativeTextModifier.numberOfLines(numberOfLines))
  }
}

extension NativeTextModifiedContent {
  public struct Disambiguation {
    internal var base: NativeTextModifiedContent<Content>
    internal init(base: NativeTextModifiedContent<Content>) {
      self.base = base
    }
    public func text() -> NativeTextModifiedContent<Content> {
      base
    }
  }
  public func disambiguation() -> NativeTextModifiedContent<Content>.Disambiguation {
    NativeTextModifiedContent<Content>.Disambiguation(base: self)
  }
}
