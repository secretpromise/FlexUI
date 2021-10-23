import Foundation

@usableFromInline
internal class AnyTextStorage: Equatable {
  func update(_ value: inout TextValue) {
    
  }
  @usableFromInline
  static func == (lhs: AnyTextStorage, rhs: AnyTextStorage) -> Bool {
    true
  }
}

@usableFromInline
class AttributedTextStorage: AnyTextStorage {
  @usableFromInline
  let attributedString: NSAttributedString
  @usableFromInline
  init(attributedString: NSAttributedString) {
    self.attributedString = attributedString
  }
  override func update(_ value: inout TextValue) {
    value.attributedString = attributedString
  }
}
