@propertyWrapper
public struct ObservedObject<ObjectType: ObservableObject>: DynamicProperty {
  @dynamicMemberLookup
  public struct Wrapper {
    internal let root: ObjectType
    public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
      Binding {
        root[keyPath: keyPath]
      } set: {
        root[keyPath: keyPath] = $0
      }
    }
  }
  @usableFromInline
  internal var _seed: Int = 0
  @_alwaysEmitIntoClient
  public init(initialValue: ObjectType) {
    self.init(wrappedValue: initialValue)
  }
  public init(wrappedValue: ObjectType) {
    self.wrappedValue = wrappedValue
  }
  public var wrappedValue: ObjectType
  public var projectedValue: Wrapper {
    Wrapper(root: wrappedValue)
  }
}
