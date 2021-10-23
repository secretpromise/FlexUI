@propertyWrapper
public struct EnvironmentObject<ObjectType: ObservableObject> : DynamicProperty  {
  public typealias Wrapper = ObservedObject<ObjectType>.Wrapper
  @inlinable
  public var wrappedValue: ObjectType {
    get {
      guard let store = _store else { error() }
      return store
    }
  }
  @usableFromInline
  internal var _store: ObjectType?
  @usableFromInline
  internal var _seed: Int = 0
  public var projectedValue: Wrapper {
    Wrapper(root: wrappedValue)
  }
  @usableFromInline
  internal func error() -> Never {
    fatalError()
  }
  public init() {}
  public init(wrappedValue: ObjectType) {
    _store = wrappedValue
  }
}
