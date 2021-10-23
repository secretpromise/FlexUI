@propertyWrapper
public struct Environment<Value>: DynamicProperty {
  @usableFromInline
  @frozen internal enum Content {
    case keyPath(KeyPath<EnvironmentValues, Value>)
    case value(Value)
  }
  @usableFromInline
  internal var content: Environment<Value>.Content
  @inlinable public init(_ keyPath: KeyPath<EnvironmentValues, Value>) {
    content = .keyPath(keyPath)
  }
  @inlinable public var wrappedValue: Value {
    get {
      switch content {
      case let .value(value):
        return value
      case let .keyPath(keyPath):
        // not bound to a view, return the default value.
        return EnvironmentValues()[keyPath : keyPath]
      }
    }
  }
  @usableFromInline
  internal func error() -> Never {
    fatalError()
  }
}
