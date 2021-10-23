import UIKit
import YogaKit

private func defaultFont() -> UIFont {
  UIFont.preferredFont(forTextStyle: .body)
}

private func defaultColor() -> UIColor {
  if #available(iOS 13.0, *) {
    return UIColor.label
  } else {
    return UIColor.darkText
  }
}

struct TextValue: Equatable {
  var font: UIFont?
  var color: UIColor?
  var string: String?
  var attributedString: NSAttributedString?
  var lineLimit: Int?
  var textAlignment: NSTextAlignment = .left
  init() {
    
  }
  func mutableAttributedString() -> NSMutableAttributedString {
    NSMutableAttributedString(attributedString: self.attributedString ?? self.string.map(NSAttributedString.init(string:))!)
  }
  init(text: Text, environment: EnvironmentValues) {
    var _value = TextValue()
    switch text.storage {
    case .verbatim(let content):
      _value.string = content
    case .anyTextStorage(let storage):
      storage.update(&_value)
    }
    _value.textAlignment = environment.multilineTextAlignment.nativeValue()
    _value.lineLimit = environment.lineLimit
    self = text.modifiers.reduce(into: _value) { (value, modifier) in
      switch modifier {
      case .font(let f):
        value.font = f?.nativeValue()
      case .color(let c):
        value.color = c?.nativeValue()
      case .italic:
        let font = value.font ?? defaultFont()
        if let fontDescriptor = font.fontDescriptor.withSymbolicTraits([.traitItalic]) {
          value.font = UIFont(descriptor: fontDescriptor, size: fontDescriptor.pointSize)
        }
      case .weight(let weight):
        if let weight = weight {
          let font = value.font ?? defaultFont()
          let fontDescriptor = font.fontDescriptor.addingAttributes([.traits: [.weight: weight, .symbolic: font.fontDescriptor.symbolicTraits]  as [UIFontDescriptor.TraitKey: Any] as Any])
          value.font = UIFont(descriptor: fontDescriptor, size: fontDescriptor.pointSize)
        }
      case .kerning(let kerning):
        let attributedString = value.mutableAttributedString()
        attributedString.addAttribute(.kern, value: kerning, range: NSRange(location: 0, length: attributedString.length))
        value.attributedString = attributedString
      case .tracking(let tracking):
        if #available(iOS 14.0, *) {
          let attributedString = value.mutableAttributedString()
          attributedString.addAttribute(.tracking, value: tracking, range: NSRange(location: 0, length: attributedString.length))
          value.attributedString = attributedString
        }
      case .baseline(let baseline):
        let attributedString = value.mutableAttributedString()
        attributedString.addAttribute(.baselineOffset, value: baseline, range: NSRange(location: 0, length: attributedString.length))
        value.attributedString = attributedString
      case .rounded:
        let font = value.font ?? defaultFont()
        if #available(iOS 13.0, *) {
          if let fontDescriptor = font.fontDescriptor.withDesign(.rounded) {
            value.font = UIFont(descriptor: fontDescriptor, size: fontDescriptor.pointSize)
          }
        }
      case .anyTextModifier(let modifier):
        modifier.update(&value)
      }
    }
  }
}

extension Text: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let node = ViewNode(
      name: "Text",
      values: TextValue(text: view.value, environment: inputs.environment)) {
      let v = _TextView()
      v.yoga.isEnabled = true
      return v
    } update: { v, value in
      defer {
        v.yoga.markDirty()
      }
      let label = v as! _TextView
      label.font = value.font ?? defaultFont()
      label.textColor = value.color ?? defaultColor()
      if value.string != nil {
        label.text = value.string
      } else {
        label.attributedText = value.attributedString
      }
      if let number = value.lineLimit {
        label.numberOfLines = number
      }
      label.textAlignment = value.textAlignment
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
}
