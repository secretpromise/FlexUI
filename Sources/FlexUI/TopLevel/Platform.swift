import UIKit
import YogaKit
import RxSwift

public enum Platform {
  
}

public protocol NativeValueConvertible {
  associatedtype NativeValue
  init(nativeValue: NativeValue)
  func nativeValue() -> NativeValue
}

extension NSObject {
  // To retain UIControl or UIGestureRecognizer target
  var _target: _Target? {
    get {
      objc_getAssociatedObject(self, &targetKey) as? _Target
    }
    set {
      objc_setAssociatedObject(self, &targetKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}

protocol FlexUIGesture {
  
}

private var targetKey: UInt8 = 0

public class _Target: NSObject {
  var action: (Any) -> Void
  init(action: @escaping (Any) -> Void) {
    self.action = action
    super.init()
  }
  @objc func _didReceiveEvent(sender: Any) {
    action(sender)
  }
}
public class _ColorView: UIView {
  
}
public class _TextView: UILabel {
  
}
public class _TextEditor: UITextField {
  
}
public class _ImageView: UIImageView {
  
}
public class _StackView: UIView {
  
}
public class _ButtonView: UIButton {
  
}
public class _TapGesture: UITapGestureRecognizer, FlexUIGesture {
  
}
public class _ScrollView: UIScrollView {
  public let contentView: UIView = UIView()
  public override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
  }
  public override var subviews: [UIView] {
    super.subviews.map { (view) in
      let isSystemView = view != contentView
      view.yoga.isEnabled = !isSystemView
      view.yoga.isIncludedInLayout = !isSystemView
      return view
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    if contentView.yoga.isEnabled {
      contentView.yoga.applyLayout(preservingOrigin: true)
      let frame = contentView.subviews.reduce(CGRect.zero, { $0.union($1.frame) })
      contentSize = frame.size
    }
  }
}
open class HostingView<Content: View>: UIView {
  public var content: Content
  private let notificationCenter: NotificationCenter = NotificationCenter()
  private var environment: EnvironmentValues = EnvironmentValues()
  private var context: Context = Context()
  private var disposeBag: DisposeBag = DisposeBag()
  private var needApplyLayout: Bool = true
  private lazy var node: ViewNode = ViewNode(
    name: "HostingView",
    valueType: Never.self
  ) { [weak self] in
    self ?? UIView()
  }
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
    super.init(frame: .zero)
    self.yoga.isEnabled = true
  }
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    if needApplyLayout {
      needApplyLayout = false
      applyLayout()
    }
    node.updateAllSubviews()
    yoga.applyLayout(preservingOrigin: true)
  }
  func applyLayout() {
    disposeBag = .init()
    let outputs = Content
      ._makeView(_GraphValue(value: content, paths: [""]), _ViewInputs(environment: environment, context: context))
    outputs.observation.forEach {
      $0.subscribe(onNext: { [weak self] in
        guard let self = self else {
          return
        }
        self.needApplyLayout = true
        self.setNeedsLayout()
      })
        .disposed(by: disposeBag)
    }
    node.updateChildren {
      $0 = outputs.nodes
    }
    node.markDirty()
    node.addAllSubviews()
  }
  public override func removeFromSuperview() {
    super.removeFromSuperview()
    disposeBag = .init()
    node.updateChildren({
      $0 = []
    })
  }
  public func invalidateHostingLayout() {
    needApplyLayout = true
  }
}

open class HostingViewController<Content: View>: UIViewController {
  public var content: Content
  private lazy var contentView: HostingView<Content> = makeContentView()
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
    super.init(nibName: nil, bundle: nil)
  }
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func makeContentView() -> HostingView<Content> {
    HostingView<Content> {
      content
    }
  }
  open override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    view.addSubview(contentView)
  }
  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if contentView.frame != view.bounds {
      contentView.frame = view.bounds
    }
  }
  public func invalidateHostingLayout() {
    contentView.invalidateHostingLayout()
  }
}

extension Color: NativeValueConvertible {
  public typealias NativeValue = UIColor
  @inlinable
  public init(nativeValue: NativeValue) {
    self.init(nativeValue.cgColor)
  }
  @inlinable
  public func nativeValue() -> NativeValue {
    .init(cgColor: cgColor)
  }
}

extension Color {
  public static let clear: Color = Color(nativeValue: .clear)
  public static let black: Color = Color(nativeValue: .black)
  public static let white: Color = Color(nativeValue: .white)
  public static let gray: Color = Color(nativeValue: .gray)
  public static let red: Color = Color(nativeValue: .red)
  public static let green: Color = Color(nativeValue: .green)
  public static let blue: Color = Color(nativeValue: .blue)
  public static let orange: Color = Color(nativeValue: .orange)
  public static let yellow: Color = Color(nativeValue: .yellow)
  public static let purple: Color = Color(nativeValue: .purple)
}

extension Font: NativeValueConvertible {
  public typealias NativeValue = UIFont
  public init(nativeValue: NativeValue) {
    self.init(provider: nativeValue)
  }
  public func nativeValue() -> NativeValue {
    provider
  }
}

extension Font {
  public static func system(size: CGFloat, weight: Weight) -> Font {
    Font(nativeValue: NativeValue.systemFont(ofSize: size, weight: weight.nativeValue()))
  }
  public static func custom(name: String, size: CGFloat) -> Font! {
    NativeValue(name: name, size: size).flatMap(Font.init(nativeValue:))
  }
}

extension Font.Weight: NativeValueConvertible {
  public typealias NativeValue = UIFont.Weight
  public init(nativeValue: NativeValue) {
    self.init(rawValue: Double(nativeValue.rawValue))
  }
  public func nativeValue() -> NativeValue {
    NativeValue(rawValue: CGFloat(rawValue))
  }
  public static let ultraLight: Font.Weight = Font.Weight(nativeValue: .ultraLight)
  public static let thin: Font.Weight       = Font.Weight(nativeValue: .thin)
  public static let light: Font.Weight      = Font.Weight(nativeValue: .light)
  public static let regular: Font.Weight    = Font.Weight(nativeValue: .regular)
  public static let medium: Font.Weight     = Font.Weight(nativeValue: .medium)
  public static let semibold: Font.Weight   = Font.Weight(nativeValue: .semibold)
  public static let bold: Font.Weight       = Font.Weight(nativeValue: .bold)
  public static let heavy: Font.Weight      = Font.Weight(nativeValue: .heavy)
  public static let black: Font.Weight      = Font.Weight(nativeValue: .black)
}

extension Image: NativeValueConvertible {
  public typealias NativeValue = UIImage
  public init(nativeValue: NativeValue) {
    self.init(provider: nativeValue)
  }
  public func nativeValue() -> NativeValue {
    provider
  }
}

extension Image {
  public init?(named name: String) {
    guard let value = UIImage(named: name).map(Image.init(nativeValue:)) else {
      return nil
    }
    self = value
  }
}

extension TextAlignment: NativeValueConvertible {
  public typealias NativeValue = NSTextAlignment
  public init(nativeValue: NativeValue) {
    switch nativeValue {
    case .center:
      self = .center
    case .left:
      self = .leading
    case .right:
      self = .trailing
    default:
      fatalError()
    }
  }
  public func nativeValue() -> NativeValue {
    switch self {
    case .center:
      return .center
    case .leading:
      return .left
    case .trailing:
      return .right
    }
  }
}
