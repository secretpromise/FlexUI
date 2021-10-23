@propertyWrapper
@dynamicMemberLookup
public struct Binding<Value>: DynamicProperty {
  internal var location: AnyLocation<Value>
  internal init(location: AnyLocation<Value>) {
    self.location = location
  }
  public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
    self.location = .init(storage: .proxy(get: get, set: set))
  }
  public static func constant(_ value: Value) -> Binding<Value> {
    Binding(get: { value }, set: { _ in fatalError() })
  }
  public var wrappedValue: Value {
    get {
      location.wrappedValue
    }
    nonmutating set {
      location.wrappedValue = newValue
    }
  }
  public var projectedValue: Binding<Value> {
    self
  }
  public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
    return Binding<Subject> {
      self.wrappedValue[keyPath: keyPath]
    } set: {
      self.wrappedValue[keyPath: keyPath] = $0
    }
  }
  @inlinable
  public func map<T>(get: @escaping (Value) -> T, update mutation: @escaping (inout Value, T, inout Bool) -> Void) -> Binding<T> {
    Binding<T> {
      get(self.wrappedValue)
    } set: { (newValue) in
      var storage = self.wrappedValue
      var failure = false
      mutation(&storage, newValue, &failure)
      if !failure {
        self.wrappedValue = storage
      }
    }
  }
  @inlinable
  public func map<T>(get: @escaping (Value) -> T, update mutation: @escaping (inout Value, T) -> Void) -> Binding<T> {
    map(get: get, update: { (storage, newValue, failure) in mutation(&storage, newValue) })
  }
  @inlinable
  public func map<T>(get: @escaping (Value) -> T, transform: @escaping (Value, T) throws -> Value) -> Binding<T> {
    map(get: get, update: { (storage, newValue, failure) in
      do {
        let localStorage = storage
        storage = try transform(localStorage, newValue)
      } catch {
        failure = true
      }
    })
  }
  @inlinable
  public func map<T>(get: @escaping (Value) -> T, transform: @escaping (T) throws -> Value) -> Binding<T> {
    map(get: get, update: { (storage, newValue, failure) in
      do {
        storage = try transform(newValue)
      } catch {
        failure = true
      }
    })
  }
  @inlinable
  public func defaultValue<T>(_ defaultValue: T) -> Binding<T> where Value == T? {
    self.map {
      $0 ?? defaultValue
    } transform: {
      $0
    }
  }
}

extension Binding where Value: Equatable {
  public func distinctUntilChanged() -> Binding<Value> {
    self.map {
      $0
    } update: { (storage, newValue, failure) in
      if storage != newValue {
        storage = newValue
      } else {
        failure = true
      }
    }
  }
}

extension Binding {
  public init<V>(_ base: Binding<V>) where Value == V? {
    self = base.map {
      $0
    } update: {  (storage, newValue, failure) in
      if newValue != nil {
        storage = newValue!
      } else {
        failure = true
      }
    }
  }
  public init?(_ base: Binding<Value?>) {
    guard let defaultValue = base.wrappedValue else {
      return nil
    }
    self = base.map {
      $0 ?? defaultValue
    } transform: {
      $0
    }
  }
  public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
    self = base.map {
      $0
    } transform: {
      $0.base as! V
    }
  }
}
