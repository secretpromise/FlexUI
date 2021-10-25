import UIKit
import YogaKit

extension YogaLayoutModifier {
  
  public static func isIncludedInLayout(_ isIncludedInLayout: Bool) -> YogaLayoutModifier {
    YogaLayoutModifier(\.isIncludedInLayout, isIncludedInLayout)
  }
  
  public static func isEnabled(_ isEnabled: Bool) -> YogaLayoutModifier {
    YogaLayoutModifier(\.isEnabled, isEnabled)
  }
  
  public static func direction(_ value: YGDirection) -> YogaLayoutModifier {
    YogaLayoutModifier(\.direction, value)
  }
  
  public static func flexDirection(_ value: YGFlexDirection) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flexDirection, value)
  }
  
  public static func justifyContent(_ value: YGJustify) -> YogaLayoutModifier {
    YogaLayoutModifier(\.justifyContent, value)
  }
  
  public static func alignContent(_ value: YGAlign) -> YogaLayoutModifier {
    YogaLayoutModifier(\.alignContent, value)
  }
  
  public static func alignItems(_ value: YGAlign) -> YogaLayoutModifier {
    YogaLayoutModifier(\.alignItems, value)
  }
  
  public static func alignSelf(_ value: YGAlign) -> YogaLayoutModifier {
    YogaLayoutModifier(\.alignSelf, value)
  }
  
  public static func position(_ value: YGPositionType) -> YogaLayoutModifier {
    YogaLayoutModifier(\.position, value)
  }
  
  public static func flexWrap(_ value: YGWrap) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flexWrap, value)
  }
  
  public static func overflow(_ value: YGOverflow) -> YogaLayoutModifier {
    YogaLayoutModifier(\.overflow, value)
  }
  
  public static func display(_ value: YGDisplay) -> YogaLayoutModifier {
    YogaLayoutModifier(\.display, value)
  }
  
  public static func flex(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flex, value)
  }
  
  public static func flexGrow(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flexGrow, value)
  }
  
  public static func flexShrink(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flexShrink, value)
  }
  
  public static func flexBasis(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.flexBasis, value)
  }
  
  public static func left(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.left, value)
  }
  
  public static func top(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.top, value)
  }
  
  public static func right(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.right, value)
  }
  
  public static func bottom(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.bottom, value)
  }
  
  public static func start(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.start, value)
  }
  
  public static func end(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.end, value)
  }
  
  public static func marginLeft(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginLeft, value)
  }
  
  public static func marginTop(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginTop, value)
  }
  
  public static func marginRight(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginRight, value)
  }
  
  public static func marginBottom(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginBottom, value)
  }
  
  public static func marginStart(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginStart, value)
  }
  
  public static func marginEnd(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginEnd, value)
  }
  
  public static func marginHorizontal(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginHorizontal, value)
  }
  
  public static func marginVertical(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.marginVertical, value)
  }
  
  public static func margin(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.margin, value)
  }
  
  public static func paddingLeft(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingLeft, value)
  }
  
  public static func paddingTop(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingTop, value)
  }
  
  public static func paddingRight(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingRight, value)
  }
  
  public static func paddingBottom(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingBottom, value)
  }
  
  public static func paddingStart(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingStart, value)
  }
  
  public static func paddingEnd(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingEnd, value)
  }
  
  public static func paddingHorizontal(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingHorizontal, value)
  }
  
  public static func paddingVertical(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.paddingVertical, value)
  }
  
  public static func padding(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.padding, value)
  }
  
  public static func borderLeftWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderLeftWidth, value)
  }
  
  public static func borderTopWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderTopWidth, value)
  }
  
  public static func borderRightWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderRightWidth, value)
  }
  
  public static func borderBottomWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderBottomWidth, value)
  }
  
  public static func borderStartWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderStartWidth, value)
  }
  
  public static func borderEndWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderEndWidth, value)
  }
  
  public static func borderWidth(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.borderWidth, value)
  }
  
  public static func width(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.width, value)
  }
  
  public static func height(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.height, value)
  }
  
  public static func minWidth(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.minWidth, value)
  }
  
  public static func maxWidth(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.maxWidth, value)
  }
  
  public static func minHeight(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.minHeight, value)
  }
  
  public static func maxHeight(_ value: YGValue) -> YogaLayoutModifier {
    YogaLayoutModifier(\.maxHeight, value)
  }
  
  public static func aspectRatio(_ value: CGFloat) -> YogaLayoutModifier {
    YogaLayoutModifier(\.aspectRatio, value)
  }
  
}

extension YogaLayoutModifier {
  
  public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> YogaLayoutModifier {
    merge(.isIncludedInLayout(isIncludedInLayout))
  }
  
  public func isEnabled(_ isEnabled: Bool) -> YogaLayoutModifier {
    merge(.isEnabled(isEnabled))
  }
  
  public func direction(_ value: YGDirection) -> YogaLayoutModifier {
    merge(.direction(value))
  }
  
  public func flexDirection(_ value: YGFlexDirection) -> YogaLayoutModifier {
    merge(.flexDirection(value))
  }
  
  public func justifyContent(_ value: YGJustify) -> YogaLayoutModifier {
    merge(.justifyContent(value))
  }
  
  public func alignContent(_ value: YGAlign) -> YogaLayoutModifier {
    merge(.alignContent(value))
  }
  
  public func alignItems(_ value: YGAlign) -> YogaLayoutModifier {
    merge(.alignItems(value))
  }
  
  public func alignSelf(_ value: YGAlign) -> YogaLayoutModifier {
    merge(.alignSelf(value))
  }
  
  public func position(_ value: YGPositionType) -> YogaLayoutModifier {
    merge(.position(value))
  }
  
  public func flexWrap(_ value: YGWrap) -> YogaLayoutModifier {
    merge(.flexWrap(value))
  }
  
  public func overflow(_ value: YGOverflow) -> YogaLayoutModifier {
    merge(.overflow(value))
  }
  
  public func display(_ value: YGDisplay) -> YogaLayoutModifier {
    merge(.display(value))
  }
  
  public func flex(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.flex(value))
  }
  
  public func flexGrow(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.flexGrow(value))
  }
  
  public func flexShrink(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.flexShrink(value))
  }
  
  public func flexBasis(_ value: YGValue) -> YogaLayoutModifier {
    merge(.flexBasis(value))
  }
  
  public func left(_ value: YGValue) -> YogaLayoutModifier {
    merge(.left(value))
  }
  
  public func top(_ value: YGValue) -> YogaLayoutModifier {
    merge(.top(value))
  }
  
  public func right(_ value: YGValue) -> YogaLayoutModifier {
    merge(.right(value))
  }
  
  public func bottom(_ value: YGValue) -> YogaLayoutModifier {
    merge(.bottom(value))
  }
  
  public func start(_ value: YGValue) -> YogaLayoutModifier {
    merge(.start(value))
  }
  
  public func end(_ value: YGValue) -> YogaLayoutModifier {
    merge(.end(value))
  }
  
  public func marginLeft(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginLeft(value))
  }
  
  public func marginTop(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginTop(value))
  }
  
  public func marginRight(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginRight(value))
  }
  
  public func marginBottom(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginBottom(value))
  }
  
  public func marginStart(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginStart(value))
  }
  
  public func marginEnd(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginEnd(value))
  }
  
  public func marginHorizontal(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginHorizontal(value))
  }
  
  public func marginVertical(_ value: YGValue) -> YogaLayoutModifier {
    merge(.marginVertical(value))
  }
  
  public func margin(_ value: YGValue) -> YogaLayoutModifier {
    merge(.margin(value))
  }
  
  public func paddingLeft(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingLeft(value))
  }
  
  public func paddingTop(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingTop(value))
  }
  
  public func paddingRight(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingRight(value))
  }
  
  public func paddingBottom(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingBottom(value))
  }
  
  public func paddingStart(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingStart(value))
  }
  
  public func paddingEnd(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingEnd(value))
  }
  
  public func paddingHorizontal(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingHorizontal(value))
  }
  
  public func paddingVertical(_ value: YGValue) -> YogaLayoutModifier {
    merge(.paddingVertical(value))
  }
  
  public func padding(_ value: YGValue) -> YogaLayoutModifier {
    merge(.padding(value))
  }
  
  public func borderLeftWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderLeftWidth(value))
  }
  
  public func borderTopWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderTopWidth(value))
  }
  
  public func borderRightWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderRightWidth(value))
  }
  
  public func borderBottomWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderBottomWidth(value))
  }
  
  public func borderStartWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderStartWidth(value))
  }
  
  public func borderEndWidth(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.borderEndWidth(value))
  }
  
  public func borderWidth(_ value: CGFloat = 1) -> YogaLayoutModifier {
    merge(.borderWidth(value))
  }
  
  public func width(_ value: YGValue) -> YogaLayoutModifier {
    merge(.width(value))
  }
  
  public func height(_ value: YGValue) -> YogaLayoutModifier {
    merge(.height(value))
  }
  
  public func minWidth(_ value: YGValue) -> YogaLayoutModifier {
    merge(.minWidth(value))
  }
  
  public func maxWidth(_ value: YGValue) -> YogaLayoutModifier {
    merge(.maxWidth(value))
  }
  
  public func minHeight(_ value: YGValue) -> YogaLayoutModifier {
    merge(.minHeight(value))
  }
  
  public func maxHeight(_ value: YGValue) -> YogaLayoutModifier {
    merge(.maxHeight(value))
  }
  
  public func aspectRatio(_ value: CGFloat) -> YogaLayoutModifier {
    merge(.aspectRatio(value))
  }
  
}
