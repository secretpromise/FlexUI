import UIKit
import YogaKit

public struct LayoutModifier: ViewModifier {
  public typealias Body = Never
  public let base: PassthroughViewModifier<YGLayout>
  public init<V>(_ keyPath: ReferenceWritableKeyPath<YGLayout, V>, _ newValue: V) {
    base = .init(
      description: "LayoutModifier: \(keyPath._kvcKeyPathString ?? "") \(newValue)",
      transform: { $0.yoga },
      block: modify(keyPath, newValue)
    )
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    PassthroughViewModifier<YGLayout>._modifyContent(modifier[\.base], inputs, body: body)
  }
}

public struct YogaModifiedContent<Content: View>: View {
  public typealias Base = PassthroughModifiedContent<Content, LayoutModifier>
  public let base: Base
  public typealias Body = Never
  public init(content: Content, modifier: LayoutModifier) {
    base = .init(content: content, modifier: modifier)
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Base._makeView(view[\.base], inputs)
  }
}

extension View {
  public func modifier(_ modifier: LayoutModifier) -> YogaModifiedContent<Self> {
    YogaModifiedContent<Self>(content: self, modifier: modifier)
  }
}

extension LayoutModifier {
  
  public static func isIncludedInLayout(_ isIncludedInLayout: Bool) -> LayoutModifier {
    LayoutModifier(\.isIncludedInLayout, isIncludedInLayout)
  }
  
  public static func isEnabled(_ isEnabled: Bool) -> LayoutModifier {
    LayoutModifier(\.isEnabled, isEnabled)
  }
  
  public static func direction(_ value: YGDirection) -> LayoutModifier {
    LayoutModifier(\.direction, value)
  }
  
  public static func flexDirection(_ value: YGFlexDirection) -> LayoutModifier {
    LayoutModifier(\.flexDirection, value)
  }
  
  public static func justifyContent(_ value: YGJustify) -> LayoutModifier {
    LayoutModifier(\.justifyContent, value)
  }
  
  public static func alignContent(_ value: YGAlign) -> LayoutModifier {
    LayoutModifier(\.alignContent, value)
  }
  
  public static func alignItems(_ value: YGAlign) -> LayoutModifier {
    LayoutModifier(\.alignItems, value)
  }
  
  public static func alignSelf(_ value: YGAlign) -> LayoutModifier {
    LayoutModifier(\.alignSelf, value)
  }
  
  public static func position(_ value: YGPositionType) -> LayoutModifier {
    LayoutModifier(\.position, value)
  }
  
  public static func flexWrap(_ value: YGWrap) -> LayoutModifier {
    LayoutModifier(\.flexWrap, value)
  }
  
  public static func overflow(_ value: YGOverflow) -> LayoutModifier {
    LayoutModifier(\.overflow, value)
  }
  
  public static func display(_ value: YGDisplay) -> LayoutModifier {
    LayoutModifier(\.display, value)
  }
  
  public static func flex(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.flex, value)
  }
  
  public static func flexGrow(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.flexGrow, value)
  }
  
  public static func flexShrink(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.flexShrink, value)
  }
  
  public static func flexBasis(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.flexBasis, value)
  }
  
  public static func left(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.left, value)
  }
  
  public static func top(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.top, value)
  }
  
  public static func right(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.right, value)
  }
  
  public static func bottom(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.bottom, value)
  }
  
  public static func start(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.start, value)
  }
  
  public static func end(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.end, value)
  }
  
  public static func marginLeft(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginLeft, value)
  }
  
  public static func marginTop(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginTop, value)
  }
  
  public static func marginRight(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginRight, value)
  }
  
  public static func marginBottom(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginBottom, value)
  }
  
  public static func marginStart(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginStart, value)
  }
  
  public static func marginEnd(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginEnd, value)
  }
  
  public static func marginHorizontal(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginHorizontal, value)
  }
  
  public static func marginVertical(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.marginVertical, value)
  }
  
  public static func margin(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.margin, value)
  }
  
  public static func paddingLeft(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingLeft, value)
  }
  
  public static func paddingTop(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingTop, value)
  }
  
  public static func paddingRight(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingRight, value)
  }
  
  public static func paddingBottom(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingBottom, value)
  }
  
  public static func paddingStart(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingStart, value)
  }
  
  public static func paddingEnd(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingEnd, value)
  }
  
  public static func paddingHorizontal(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingHorizontal, value)
  }
  
  public static func paddingVertical(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.paddingVertical, value)
  }
  
  public static func padding(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.padding, value)
  }
  
  public static func borderLeftWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderLeftWidth, value)
  }
  
  public static func borderTopWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderTopWidth, value)
  }
  
  public static func borderRightWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderRightWidth, value)
  }
  
  public static func borderBottomWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderBottomWidth, value)
  }
  
  public static func borderStartWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderStartWidth, value)
  }
  
  public static func borderEndWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderEndWidth, value)
  }
  
  public static func borderWidth(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.borderWidth, value)
  }
  
  public static func width(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.width, value)
  }
  
  public static func height(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.height, value)
  }
  
  public static func minWidth(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.minWidth, value)
  }
  
  public static func maxWidth(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.maxWidth, value)
  }
  
  public static func minHeight(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.minHeight, value)
  }
  
  public static func maxHeight(_ value: YGValue) -> LayoutModifier {
    LayoutModifier(\.maxHeight, value)
  }
  
  public static func aspectRatio(_ value: CGFloat) -> LayoutModifier {
    LayoutModifier(\.aspectRatio, value)
  }
  
}

extension View {
  
  public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.isIncludedInLayout(isIncludedInLayout))
  }

  public func isEnabled(_ isEnabled: Bool) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.isEnabled(isEnabled))
  }

  public func direction(_ value: YGDirection) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.direction(value))
  }

  public func flexDirection(_ value: YGFlexDirection) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flexDirection(value))
  }

  public func justifyContent(_ value: YGJustify) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.justifyContent(value))
  }

  public func alignContent(_ value: YGAlign) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.alignContent(value))
  }

  public func alignItems(_ value: YGAlign) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.alignItems(value))
  }

  public func alignSelf(_ value: YGAlign) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.alignSelf(value))
  }

  public func position(_ value: YGPositionType) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.position(value))
  }

  public func flexWrap(_ value: YGWrap) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flexWrap(value))
  }

  public func overflow(_ value: YGOverflow) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.overflow(value))
  }

  public func display(_ value: YGDisplay) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.display(value))
  }

  public func flex(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flex(value))
  }

  public func flexGrow(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flexGrow(value))
  }

  public func flexShrink(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flexShrink(value))
  }

  public func flexBasis(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.flexBasis(value))
  }

  public func left(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.left(value))
  }

  public func top(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.top(value))
  }

  public func right(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.right(value))
  }

  public func bottom(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.bottom(value))
  }

  public func start(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.start(value))
  }

  public func end(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.end(value))
  }

  public func marginLeft(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginLeft(value))
  }

  public func marginTop(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginTop(value))
  }

  public func marginRight(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginRight(value))
  }

  public func marginBottom(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginBottom(value))
  }

  public func marginStart(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginStart(value))
  }

  public func marginEnd(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginEnd(value))
  }

  public func marginHorizontal(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginHorizontal(value))
  }

  public func marginVertical(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.marginVertical(value))
  }

  public func margin(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.margin(value))
  }

  public func paddingLeft(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingLeft(value))
  }

  public func paddingTop(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingTop(value))
  }

  public func paddingRight(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingRight(value))
  }

  public func paddingBottom(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingBottom(value))
  }

  public func paddingStart(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingStart(value))
  }

  public func paddingEnd(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingEnd(value))
  }

  public func paddingHorizontal(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingHorizontal(value))
  }

  public func paddingVertical(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.paddingVertical(value))
  }

  public func padding(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.padding(value))
  }

  public func borderLeftWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderLeftWidth(value))
  }

  public func borderTopWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderTopWidth(value))
  }

  public func borderRightWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderRightWidth(value))
  }

  public func borderBottomWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderBottomWidth(value))
  }

  public func borderStartWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderStartWidth(value))
  }

  public func borderEndWidth(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderEndWidth(value))
  }

  public func borderWidth(_ value: CGFloat = 1) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.borderWidth(value))
  }

  public func width(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.width(value))
  }

  public func height(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.height(value))
  }

  public func minWidth(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.minWidth(value))
  }

  public func maxWidth(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.maxWidth(value))
  }

  public func minHeight(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.minHeight(value))
  }

  public func maxHeight(_ value: YGValue) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.maxHeight(value))
  }

  public func aspectRatio(_ value: CGFloat) -> YogaModifiedContent<Self> {
    modifier(LayoutModifier.aspectRatio(value))
  }

}

extension YogaModifiedContent {
  public struct Disambiguation {
    internal var base: YogaModifiedContent<Content>
    internal init(base: YogaModifiedContent<Content>) {
      self.base = base
    }
    public func yoga() -> YogaModifiedContent<Content> {
      base
    }
  }
  public func disambiguation() -> YogaModifiedContent<Content>.Disambiguation {
    YogaModifiedContent<Content>.Disambiguation(base: self)
  }
}
