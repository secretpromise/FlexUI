import UIKit
import YogaKit

public struct NativeButtonModifier: ViewModifier {
  public typealias Body = Never
  public let base: PassthroughViewModifier<UIButton>
  public init<B>(
    _ keyPath: ReferenceWritableKeyPath<UIButton, B>,
    _ newValue: B
  ) {
    base = .init(keyPath, newValue)
  }
  public init(
    description: String,
    block: @escaping (UIButton) -> Void
  ) {
    base = .init(description: description, block: block)
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier<UIButton>._modifyContent(modifier[\.base], inputs, body: body)
  }
}

public struct NativeButtonModifiedContent<Content: View>: View {
  public typealias Base = PassthroughModifiedContent<Content, NativeButtonModifier>
  public let base: Base
  public typealias Body = Never
  public init(content: Content, modifier: NativeButtonModifier) {
    base = .init(content: content, modifier: modifier)
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Base._makeView(view[\.base], inputs)
  }
}

extension View {
  public func modifier(_ modifier: NativeButtonModifier) -> NativeButtonModifiedContent<Self> {
    NativeButtonModifiedContent<Self>(content: self, modifier: modifier)
  }
}

extension NativeButtonModifier {
  public static func isEnabled(_ isEnabled: Bool) -> NativeButtonModifier {
    NativeButtonModifier(\.isEnabled, isEnabled)
  }
  public static func setImage(_ image: Image?, for state: UIControl.State) -> NativeButtonModifier {
    NativeButtonModifier(description: #function) {
      $0.setImage(image?.nativeValue(), for: state)
    }
  }
  public static func setTitle(_ title: String?, for state: UIControl.State) -> NativeButtonModifier {
    NativeButtonModifier(description: #function) {
      $0.setTitle(title, for: state)
    }
  }
  public static func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> NativeButtonModifier {
    NativeButtonModifier(\.contentEdgeInsets, contentEdgeInsets)
  }
  public static func setTitleColor(_ titleColor: Color?, for state: UIControl.State) -> NativeButtonModifier {
    NativeButtonModifier(description: #function) {
      $0.setTitleColor(titleColor?.nativeValue(), for: state)
    }
  }
  public static func font(_ font: Font?) -> NativeButtonModifier {
    NativeButtonModifier(description: #function) {
      $0.titleLabel?.font = font?.nativeValue()
    }
  }
}

extension View {
  public func setImage(_ image: Image?, for state: UIControl.State = .normal) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.setImage(image, for: state))
  }
  public func isEnabled(_ isEnabled: Bool) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.isEnabled(isEnabled))
  }
  public func setTitle(_ title: String?, for state: UIControl.State = .normal) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.setTitle(title, for: state))
  }
  public func setTitleColor(_ titleColor: Color?, for state: UIControl.State = .normal) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.setTitleColor(titleColor, for: state))
  }
  public func font(_ font: Font?) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.font(font))
  }
  public func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> NativeButtonModifiedContent<Self> {
    modifier(NativeButtonModifier.contentEdgeInsets(contentEdgeInsets))
  }
}

extension NativeButtonModifiedContent {
  public struct Disambiguation {
    internal var base: NativeButtonModifiedContent<Content>
    internal init(base: NativeButtonModifiedContent<Content>) {
      self.base = base
    }
    public func button() -> NativeButtonModifiedContent<Content> {
      base
    }
  }
  public func disambiguation() -> NativeButtonModifiedContent<Content>.Disambiguation {
    NativeButtonModifiedContent<Content>.Disambiguation(base: self)
  }
}
