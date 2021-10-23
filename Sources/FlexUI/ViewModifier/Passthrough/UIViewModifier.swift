import UIKit
import YogaKit

public struct UIViewModifier: ViewModifier  {
  public typealias Body = Never
  public let base: PassthroughViewModifier<UIView>
  public init<B>(
    _ keyPath: ReferenceWritableKeyPath<UIView, B>,
    _ newValue: B
  ) {
    base = .init(keyPath, newValue)
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier<UIView>._modifyContent(modifier[\.base], inputs, body: body)
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
  public func modifier(_ modifier: UIViewModifier) -> UIViewModifiedContent<Self> {
    UIViewModifiedContent<Self>(content: self, modifier: modifier)
  }
}

extension UIViewModifier {
  public static func tag(_ tag: Int) -> UIViewModifier {
    UIViewModifier(\.tag, tag)
  }
  public static func backgroundColor(_ backgroundColor: Color?) -> UIViewModifier {
    UIViewModifier(\.backgroundColor, backgroundColor?.nativeValue())
  }
  public static func clipsToBounds(_ clipsToBounds: Bool) -> UIViewModifier {
    UIViewModifier(\.clipsToBounds, clipsToBounds)
  }
  public static func cornerRadius(_ cornerRadius: CGFloat, _ clipsToBounds: Bool = true) -> UIViewModifier {
    UIViewModifier(\.layer.cornerRadius, cornerRadius)
  }
  public static func borderColor(_ borderColor: Color?) -> UIViewModifier {
    UIViewModifier(\.layer.borderColor, borderColor?.nativeValue().cgColor)
  }
  public static func borderWidth(_ borderWidth: CGFloat) -> UIViewModifier {
    UIViewModifier(\.layer.borderWidth, borderWidth)
  }
  public static func alpha(_ alpha: CGFloat) -> UIViewModifier {
    UIViewModifier(\.alpha, alpha)
  }
  public static func translatesAutoresizingMaskIntoConstraints(
    _ translatesAutoresizingMaskIntoConstraints: Bool
  ) -> UIViewModifier {
    UIViewModifier(\.translatesAutoresizingMaskIntoConstraints, translatesAutoresizingMaskIntoConstraints)
  }
  public static func transform(_ transform: CGAffineTransform) -> UIViewModifier {
    UIViewModifier(\.transform, transform)
  }
  public static func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> UIViewModifier {
    UIViewModifier(\.isUserInteractionEnabled, isUserInteractionEnabled)
  }
  public static func isHidden(_ isHidden: Bool) -> UIViewModifier {
    UIViewModifier(\.isHidden, isHidden)
  }
  public static func contentMode(_ contentMode: UIView.ContentMode) -> UIViewModifier {
    UIViewModifier(\.contentMode, contentMode)
  }
  @available(iOS 11.0, *)
  public static func maskedCorners(_ maskedCorners: CACornerMask) -> UIViewModifier {
    UIViewModifier(\.layer.maskedCorners, maskedCorners)
  }
}

extension UIRectCorner {
  func corners() -> CACornerMask {
    var corners: CACornerMask = []
    if self.contains(.topLeft) {
      corners.insert(.layerMinXMinYCorner)
    }
    if self.contains(.topRight) {
      corners.insert(.layerMaxXMinYCorner)
    }
    if self.contains(.bottomLeft) {
      corners.insert(.layerMinXMaxYCorner)
    }
    if self.contains(.bottomRight) {
      corners.insert(.layerMaxXMaxYCorner)
    }
    return corners
  }
}

extension View {
  public func tag(_ tag: Int) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.tag(tag))
  }
  public func backgroundColor(_ backgroundColor: Color?) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.backgroundColor(backgroundColor))
  }
  public func clipsToBounds(_ clipsToBounds: Bool = true) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.clipsToBounds(clipsToBounds))
  }
  public func cornerRadius(_ cornerRadius: CGFloat) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.cornerRadius(cornerRadius))
  }
  public func borderColor(_ borderColor: Color?) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.borderColor(borderColor))
  }
  public func borderWidth(_ borderWidth: CGFloat = 1) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.borderWidth(borderWidth))
  }
  public func alpha(_ alpha: CGFloat) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.alpha(alpha))
  }
  public func translatesAutoresizingMaskIntoConstraints(
    _ translatesAutoresizingMaskIntoConstraints: Bool
  ) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.translatesAutoresizingMaskIntoConstraints(translatesAutoresizingMaskIntoConstraints))
  }
  public func transform(_ transform: CGAffineTransform) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.transform(transform))
  }
  public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.isUserInteractionEnabled(isUserInteractionEnabled))
  }
  public func isHidden(_ isHidden: Bool) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.isHidden(isHidden))
  }
  public func contentMode(_ contentMode: UIView.ContentMode) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.contentMode(contentMode))
  }
  @available(iOS 11.0, *)
  public func maskedCorners(_ maskedCorners: CACornerMask) -> UIViewModifiedContent<Self> {
    modifier(UIViewModifier.maskedCorners(maskedCorners))
  }
  @ViewBuilder
  public func maskedCorners(_ maskedCorners: UIRectCorner) -> _ConditionalContent<AnyView, Self> {
    if #available(iOS 11.0, *) {
      self.maskedCorners(maskedCorners.corners())
    } else {
      self
    }
  }
}

extension UIViewModifiedContent {
  public struct Disambiguation {
    internal var base: UIViewModifiedContent<Content>
    internal init(base: UIViewModifiedContent<Content>) {
      self.base = base
    }
    public func view() -> UIViewModifiedContent<Content> {
      base
    }
  }
  public func disambiguation() -> UIViewModifiedContent<Content>.Disambiguation {
    UIViewModifiedContent<Content>.Disambiguation(base: self)
  }
}
