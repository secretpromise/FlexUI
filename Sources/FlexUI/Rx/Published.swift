import RxSwift

@propertyWrapper
public struct Published<Value> {
  // see also: https://github.com/apple/swift/blob/master/test/decl/var/property_wrappers.swift
  private var value: Value
  @available(*, unavailable, message: "must be in a class")
  public var wrappedValue: Value {
    get { fatalError("called wrappedValue getter") }
    set { fatalError("called wrappedValue setter") }
  }
  public static subscript<EnclosingSelf: AnyObject>(_enclosingInstance observed: EnclosingSelf, wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>, storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Published<Value>>) -> Value {
    get {
      return observed[keyPath: storageKeyPath].value
    }
    set {
      observed[keyPath: storageKeyPath].projectedValue.subject.onNext(newValue)
      Published<Value>.getPublisher(for: observed)?.send()
      observed[keyPath: storageKeyPath].value = newValue
    }
  }
  /// Initialize the storage of the Published property as well as the corresponding `Publisher`.
  public init(wrappedValue: Value) {
    self.value = wrappedValue
  }
  public init(initialValue: Value) {
    self.value = initialValue
  }
  public struct Publisher: InfallibleType, Equatable {
    public typealias Element = Value
    fileprivate let subject: BehaviorSubject<Element>
    public init(_ value: Value) {
      subject = .init(value: value)
    }
    public func asObservable() -> Observable<Value> {
      subject.asObservable()
    }
    public static func == (lhs: Publisher, rhs: Publisher) -> Bool {
      lhs.subject === rhs.subject
    }
  }
  public private(set) lazy var projectedValue: Self.Publisher = {
    return .init(value)
  }()
}
