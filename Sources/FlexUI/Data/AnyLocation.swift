import RxSwift

@usableFromInline
enum AnyLocationStorage<Value> {
  case proxy(get: () -> Value, set: (Value) -> Void)
  case local(value: Value)
}

@usableFromInline
internal class AnyLocationBase {
  private var storage: AnyLocationStorage<Any>
  private let subject: PublishSubject<()>
  func asObservable() -> Observable<()> {
    subject.asObservable()
  }
  fileprivate var value: Any {
    get {
      switch storage {
      case .proxy(let get, _):
        return get()
      case .local(let value):
        return value
      }
    }
    set {
      switch storage {
      case .proxy(_, let set):
        set(newValue)
      case .local:
        storage = .local(value: newValue)
      }
      subject.onNext(())
    }
  }
  fileprivate init(storage: AnyLocationStorage<Any>) {
    self.storage = storage
    subject = .init()
  }
}

@usableFromInline
internal class AnyLocation<Value> : AnyLocationBase {
  init(storage: AnyLocationStorage<Value>) {
    switch storage {
    case .local(let value):
      super.init(storage: .local(value: value))
    case .proxy(let get, let set):
      super.init(storage: .proxy(get: { get() }, set: { set($0 as! Value) }))
    }
  }
  var wrappedValue: Value {
    get {
      value as! Value
    }
    set {
      value = newValue
    }
  }
}
