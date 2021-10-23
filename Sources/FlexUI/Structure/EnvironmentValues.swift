public struct EnvironmentValues: CustomStringConvertible {
  private var dict: [String: Any] = [:]
  public init() {
    
  }
  public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey {
    get {
      dict["\(key)"] as? K.Value ?? key.defaultValue
    }
    set {
      dict["\(key)"] = newValue
    }
  }
  public var description: String {
    """
    EnvironmentValues
    \(dict.map({ "<key: \($0.key), value: \($0.value)>" }).joined(separator: "\n"))
    """
  }
}
