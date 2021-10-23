import CoreGraphics

public struct Color: Equatable {
  public typealias Body = Never
  public enum RGBColorSpace: Equatable, Hashable {
    case sRGB
    case sRGBLinear
    case displayP3
  }
  public let cgColor: CGColor
  @inlinable
  public init(_ cgColor: CGColor) {
    self.cgColor = cgColor
  }
  @inlinable
  public init(_ colorSpace: RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) {
    var components = [CGFloat(red), CGFloat(green), CGFloat(blue), CGFloat(opacity)]
    switch colorSpace {
    case .sRGB:
      self.init(CGColor(colorSpace: CGColorSpace(name: CGColorSpace.sRGB)!, components: &components)!)
    case .sRGBLinear:
      if #available(iOS 10.0, *) {
        self.init(CGColor(colorSpace: CGColorSpace(name: CGColorSpace.linearSRGB)!, components: &components)!)
      } else {
        fatalError()
      }
    case .displayP3:
      if #available(iOS 9.3, *) {
        self.init(CGColor(colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!, components: &components)!)
      } else {
        fatalError()
      }
    }
  }
  @inlinable
  public init(_ colorSpace: RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
    self.init(colorSpace, red: white, green: white, blue: white, opacity: opacity)
  }
  @inlinable
  public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
    self.init(NativeValue(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: CGFloat(opacity)).cgColor)
  }
  @inlinable
  public func opacity(_ opacity: Double) -> Color {
    Color(cgColor.copy(alpha: CGFloat(opacity))!)
  }
}
