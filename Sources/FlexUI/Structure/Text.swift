import CoreGraphics

@usableFromInline
internal class AnyTextModifier: Equatable {
  func update(_ value: inout TextValue) {
    
  }
  @usableFromInline
  static func == (lhs: AnyTextModifier, rhs: AnyTextModifier) -> Bool {
    true
  }
}

public struct Text: Equatable {
  public typealias Body = Never
  @usableFromInline
  internal enum Storage : Equatable {
    case verbatim(String)
    case anyTextStorage(AnyTextStorage)
  }
  @usableFromInline
  internal enum Modifier: Equatable {
    case color(Color?)
    case font(Font?)
    case italic
    case weight(Font.Weight?)
    case kerning(CGFloat)
    case tracking(CGFloat)
    case baseline(CGFloat)
    case rounded
    case anyTextModifier(AnyTextModifier)
  }
  @usableFromInline
  internal var storage: Storage
  @usableFromInline
  internal var modifiers: [Modifier] = [Modifier]()
  @inlinable
  public init(verbatim content: String) {
    self.init(storage: .verbatim(content))
  }
  @inlinable
  public init(attributedString: NSAttributedString) {
    self.init(storage: .anyTextStorage(AttributedTextStorage(attributedString: attributedString)))
  }
  @usableFromInline
  internal init(storage: Storage) {
    self.storage = storage
  }
}

extension Text {
  internal func withModifier(_ block: (inout Text) -> Void) -> Text {
    var text = self
    block(&text)
    return text
  }
  public func foregroundColor(_ color: Color?) -> Text {
    withModifier { text in
      text.modifiers.append(.color(color))
    }
  }
  public func font(_ font: Font?) -> Text {
    withModifier { text in
      text.modifiers.append(.font(font))
    }
  }
  public func fontWeight(_ weight: Font.Weight?) -> Text {
    withModifier { text in
      text.modifiers.append(.weight(weight))
    }
  }
  public func bold() -> Text {
    fontWeight(.bold)
  }
  public func italic() -> Text {
    withModifier { text in
      text.modifiers.append(.italic)
    }
  }
  public func strikethrough(_ active: Bool = true, color: Color? = nil) -> Text {
    withModifier { text in
      text.modifiers.append(.color(color))
    }
  }
  public func underline(_ active: Bool = true, color: Color? = nil) -> Text {
    withModifier { text in
      text.modifiers.append(.color(color))
    }
  }
  public func kerning(_ kerning: CGFloat) -> Text {
    withModifier { text in
      text.modifiers.append(.kerning(kerning))
    }
  }
  public func tracking(_ tracking: CGFloat) -> Text {
    withModifier { text in
      text.modifiers.append(.tracking(tracking))
    }
  }
  public func baselineOffset(_ baselineOffset: CGFloat) -> Text {
    withModifier { text in
      text.modifiers.append(.baseline(baselineOffset))
    }
  }
}
