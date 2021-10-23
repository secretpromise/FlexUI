import UIKit

// for UIView different subclass, but same keyPath
extension UIViewModifier {
  public static func isEnabled(_ isEnabled: Bool) -> UIViewModifier {
    UIViewModifier.dynamic(description: #function) { view in
      if view.responds(to: #selector(setter: UIControl.isEnabled)) {
        view.setValue(isEnabled, forKey: #keyPath(UIControl.isEnabled))
      }
    }
  }
  public static func font(_ font: Font?) -> UIViewModifier {
    UIViewModifier.dynamic(description: #function) { view in
      if let button = view as? UIButton {
        button.titleLabel?.font = font?.nativeValue()
      } else {
        if view.responds(to: #selector(setter: UILabel.font)) {
          view.setValue(font?.nativeValue(), forKey: #keyPath(UILabel.font))
        }
      }
    }
  }
}

extension UIViewModifier {
  public func isEnabled(_ isEnabled: Bool) -> UIViewModifier {
    merge(.isEnabled(isEnabled))
  }
  public func font(_ font: Font?) -> UIViewModifier {
    merge(.font(font))
  }
}
