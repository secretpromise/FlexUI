import RxSwift

public final class ObservableObjectPublisher: InfallibleType {
  public typealias Element = ()
  internal let subject: PublishSubject<()>
  public init() {
    subject = .init()
  }
  public func asObservable() -> Observable<()> {
    subject.asObservable()
  }
  public func send() {
    subject.onNext(())
  }
}
