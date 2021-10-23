import UIKit
import YogaKit

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

extension LayoutModifier {
  
  public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> LayoutModifier {
    merge(.isIncludedInLayout(isIncludedInLayout))
  }
  
  public func isEnabled(_ isEnabled: Bool) -> LayoutModifier {
    merge(.isEnabled(isEnabled))
  }
  
  public func direction(_ value: YGDirection) -> LayoutModifier {
    merge(.direction(value))
  }
  
  public func flexDirection(_ value: YGFlexDirection) -> LayoutModifier {
    merge(.flexDirection(value))
  }
  
  public func justifyContent(_ value: YGJustify) -> LayoutModifier {
    merge(.justifyContent(value))
  }
  
  public func alignContent(_ value: YGAlign) -> LayoutModifier {
    merge(.alignContent(value))
  }
  
  public func alignItems(_ value: YGAlign) -> LayoutModifier {
    merge(.alignItems(value))
  }
  
  public func alignSelf(_ value: YGAlign) -> LayoutModifier {
    merge(.alignSelf(value))
  }
  
  public func position(_ value: YGPositionType) -> LayoutModifier {
    merge(.position(value))
  }
  
  public func flexWrap(_ value: YGWrap) -> LayoutModifier {
    merge(.flexWrap(value))
  }
  
  public func overflow(_ value: YGOverflow) -> LayoutModifier {
    merge(.overflow(value))
  }
  
  public func display(_ value: YGDisplay) -> LayoutModifier {
    merge(.display(value))
  }
  
  public func flex(_ value: CGFloat) -> LayoutModifier {
    merge(.flex(value))
  }
  
  public func flexGrow(_ value: CGFloat) -> LayoutModifier {
    merge(.flexGrow(value))
  }
  
  public func flexShrink(_ value: CGFloat) -> LayoutModifier {
    merge(.flexShrink(value))
  }
  
  public func flexBasis(_ value: YGValue) -> LayoutModifier {
    merge(.flexBasis(value))
  }
  
  public func left(_ value: YGValue) -> LayoutModifier {
    merge(.left(value))
  }
  
  public func top(_ value: YGValue) -> LayoutModifier {
    merge(.top(value))
  }
  
  public func right(_ value: YGValue) -> LayoutModifier {
    merge(.right(value))
  }
  
  public func bottom(_ value: YGValue) -> LayoutModifier {
    merge(.bottom(value))
  }
  
  public func start(_ value: YGValue) -> LayoutModifier {
    merge(.start(value))
  }
  
  public func end(_ value: YGValue) -> LayoutModifier {
    merge(.end(value))
  }
  
  public func marginLeft(_ value: YGValue) -> LayoutModifier {
    merge(.marginLeft(value))
  }
  
  public func marginTop(_ value: YGValue) -> LayoutModifier {
    merge(.marginTop(value))
  }
  
  public func marginRight(_ value: YGValue) -> LayoutModifier {
    merge(.marginRight(value))
  }
  
  public func marginBottom(_ value: YGValue) -> LayoutModifier {
    merge(.marginBottom(value))
  }
  
  public func marginStart(_ value: YGValue) -> LayoutModifier {
    merge(.marginStart(value))
  }
  
  public func marginEnd(_ value: YGValue) -> LayoutModifier {
    merge(.marginEnd(value))
  }
  
  public func marginHorizontal(_ value: YGValue) -> LayoutModifier {
    merge(.marginHorizontal(value))
  }
  
  public func marginVertical(_ value: YGValue) -> LayoutModifier {
    merge(.marginVertical(value))
  }
  
  public func margin(_ value: YGValue) -> LayoutModifier {
    merge(.margin(value))
  }
  
  public func paddingLeft(_ value: YGValue) -> LayoutModifier {
    merge(.paddingLeft(value))
  }
  
  public func paddingTop(_ value: YGValue) -> LayoutModifier {
    merge(.paddingTop(value))
  }
  
  public func paddingRight(_ value: YGValue) -> LayoutModifier {
    merge(.paddingRight(value))
  }
  
  public func paddingBottom(_ value: YGValue) -> LayoutModifier {
    merge(.paddingBottom(value))
  }
  
  public func paddingStart(_ value: YGValue) -> LayoutModifier {
    merge(.paddingStart(value))
  }
  
  public func paddingEnd(_ value: YGValue) -> LayoutModifier {
    merge(.paddingEnd(value))
  }
  
  public func paddingHorizontal(_ value: YGValue) -> LayoutModifier {
    merge(.paddingHorizontal(value))
  }
  
  public func paddingVertical(_ value: YGValue) -> LayoutModifier {
    merge(.paddingVertical(value))
  }
  
  public func padding(_ value: YGValue) -> LayoutModifier {
    merge(.padding(value))
  }
  
  public func borderLeftWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderLeftWidth(value))
  }
  
  public func borderTopWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderTopWidth(value))
  }
  
  public func borderRightWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderRightWidth(value))
  }
  
  public func borderBottomWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderBottomWidth(value))
  }
  
  public func borderStartWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderStartWidth(value))
  }
  
  public func borderEndWidth(_ value: CGFloat) -> LayoutModifier {
    merge(.borderEndWidth(value))
  }
  
  public func borderWidth(_ value: CGFloat = 1) -> LayoutModifier {
    merge(.borderWidth(value))
  }
  
  public func width(_ value: YGValue) -> LayoutModifier {
    merge(.width(value))
  }
  
  public func height(_ value: YGValue) -> LayoutModifier {
    merge(.height(value))
  }
  
  public func minWidth(_ value: YGValue) -> LayoutModifier {
    merge(.minWidth(value))
  }
  
  public func maxWidth(_ value: YGValue) -> LayoutModifier {
    merge(.maxWidth(value))
  }
  
  public func minHeight(_ value: YGValue) -> LayoutModifier {
    merge(.minHeight(value))
  }
  
  public func maxHeight(_ value: YGValue) -> LayoutModifier {
    merge(.maxHeight(value))
  }
  
  public func aspectRatio(_ value: CGFloat) -> LayoutModifier {
    merge(.aspectRatio(value))
  }
  
}
