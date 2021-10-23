@propertyWrapper
public struct StateObject<ObjectType: ObservableObject>: DynamicProperty {
  public typealias Wrapper = ObservedObject<ObjectType>.Wrapper
  @usableFromInline
  internal enum Storage {
    case initially(() -> ObjectType)
    case object(ObservedObject<ObjectType>)
  }
  @usableFromInline
  internal var storage: Storage
  @inlinable
  public init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType) {
    storage = .initially(thunk)
  }
  public var wrappedValue: ObjectType {
    switch storage {
    case .initially(let thunk):
      return thunk()
    case .object(let object):
      return object.wrappedValue
    }
  }
  public var projectedValue: Wrapper {
    Wrapper(root: wrappedValue)
  }
}
