import ObjectiveC.runtime

extension ObservableObjectPublisher {
  fileprivate enum AssociatedObjectKey {
    static var objectWillChange: String = "objectWillChange"
  }
}

protocol _ObservableObjectPublisherAssociation {}

extension _ObservableObjectPublisherAssociation {
  private static var key: UnsafeRawPointer {
    UnsafeRawPointer(&ObservableObjectPublisher.AssociatedObjectKey.objectWillChange)
  }

  private static func _setPublisher(_ object: Any, _ publisher: ObservableObjectPublisher?) {
    objc_setAssociatedObject(object, key, publisher, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
  
  private static func _publisher(_ object: Any) -> ObservableObjectPublisher? {
    objc_getAssociatedObject(object, key) as? ObservableObjectPublisher
  }

  /// get publisher
  /// - Parameter object: sender
  /// - Returns: publisher
  internal static func getPublisher(for object: AnyObject) -> ObservableObjectPublisher? {
    _publisher(object) ?? {
      // if Self is ObservableObjectPublisher, so means that this is called
      // inside *ObservableObject* 's *objectWillChange* 's default implementation
      Self.self == ObservableObjectPublisher.self ? {
        let publisher = ObservableObjectPublisher()
        _setPublisher(object, publisher)
        return publisher
      }() : nil
    }()
  }
}

extension Published: _ObservableObjectPublisherAssociation {}

extension ObservableObjectPublisher: _ObservableObjectPublisherAssociation {}
