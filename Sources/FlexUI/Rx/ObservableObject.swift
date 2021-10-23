import RxSwift

public protocol ObservableObject : AnyObject {
  associatedtype ObjectWillChangePublisher : InfallibleType = ObservableObjectPublisher
  var objectWillChange: Self.ObjectWillChangePublisher { get }
}

extension ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
  /// A publisher that emits before the object has changed.
  public var objectWillChange: ObservableObjectPublisher {
    let publisher = ObjectWillChangePublisher.getPublisher(for: self)!
    return publisher
  }
}
