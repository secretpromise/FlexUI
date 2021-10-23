import UIKit

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
}

extension UIViewModifier {
  public func tag(_ tag: Int) -> UIViewModifier {
    merge(.tag(tag))
  }
  public func backgroundColor(_ backgroundColor: Color?) -> UIViewModifier {
    merge(.backgroundColor(backgroundColor))
  }
  public func clipsToBounds(_ clipsToBounds: Bool = true) -> UIViewModifier {
    merge(.clipsToBounds(clipsToBounds))
  }
  public func cornerRadius(_ cornerRadius: CGFloat) -> UIViewModifier {
    merge(.cornerRadius(cornerRadius))
  }
  public func borderColor(_ borderColor: Color?) -> UIViewModifier {
    merge(.borderColor(borderColor))
  }
  public func borderWidth(_ borderWidth: CGFloat = 1) -> UIViewModifier {
    merge(.borderWidth(borderWidth))
  }
  public func alpha(_ alpha: CGFloat) -> UIViewModifier {
    merge(.alpha(alpha))
  }
  public func translatesAutoresizingMaskIntoConstraints(
    _ translatesAutoresizingMaskIntoConstraints: Bool
  ) -> UIViewModifier {
    merge(.translatesAutoresizingMaskIntoConstraints(translatesAutoresizingMaskIntoConstraints))
  }
  public func transform(_ transform: CGAffineTransform) -> UIViewModifier {
    merge(.transform(transform))
  }
  public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> UIViewModifier {
    merge(.isUserInteractionEnabled(isUserInteractionEnabled))
  }
  public func isHidden(_ isHidden: Bool) -> UIViewModifier {
    merge(.isHidden(isHidden))
  }
  public func contentMode(_ contentMode: UIView.ContentMode) -> UIViewModifier {
    merge(.contentMode(contentMode))
  }
}
