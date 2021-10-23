@usableFromInline
internal class StateStorage {
  @usableFromInline
  internal var _location: AnyLocationBase?
}
  
@propertyWrapper
public struct State<Value>: DynamicProperty {
  @usableFromInline
  internal var _value: Value
  @usableFromInline
  internal var _location: AnyLocation<Value>? {
    get {
      inner._location as? AnyLocation<Value>
    }
    nonmutating set {
      inner._location = newValue
    }
  }
  internal var inner: StateStorage = StateStorage()
  public init(wrappedValue value: Value) {
    _value = value
  }
  public init(initialValue value: Value) {
    _value = value
  }
  public var wrappedValue: Value {
    get {
      _location?.wrappedValue ?? _value
    }
    nonmutating set {
      if _location == nil {
        _location = .init(storage: .local(value: newValue))
      } else {
        _location?.wrappedValue = newValue
      }
    }
  }
  public var projectedValue: Binding<Value> {
    Binding<Value>(get: { self.wrappedValue }, set: { self.wrappedValue = $0 })
  }
  internal func makeLocation(get: @escaping () -> Any, set: @escaping (Any) -> Void) {
    _location = AnyLocation<Value>(
      storage: .proxy(
        get: {
          get() as! Value
        },
        set: {
          set($0)
        }
      )
    )
  }
}

extension State where Value : ExpressibleByNilLiteral {
  @inlinable public init() {
    self.init(wrappedValue: nil)
  }
}
