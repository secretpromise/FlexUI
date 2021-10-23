struct AnyEquatable: Equatable {
  var base: Any
  private var block: (AnyEquatable, AnyEquatable) -> Bool
  init(base: Any) {
    self.base = base
    self.block = { _, _ in
      false
    }
  }
  init<T: Equatable>(value: T) {
    self.base = value
    self.block = {
      return ($0.base as? T) == ($1.base as? T)
    }
  }
  init<T: AnyObject>(object: T) {
    self.base = object
    self.block = {
      return ($0.base as? T).map(ObjectIdentifier.init) == ($1.base as? T).map(ObjectIdentifier.init)
    }
  }
  static func == (lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
    lhs.block(lhs, rhs)
  }
}

internal struct Always: Equatable {
  private init() {
    
  }
  static var always: Always {
    Always()
  }
  static func == (lhs: Always, rhs: Always) -> Bool {
    false
  }
}

internal struct Once: Equatable {
  private init() {
    
  }
  static var once: Once {
    Once()
  }
  static func == (lhs: Once, rhs: Once) -> Bool {
    true
  }
}
