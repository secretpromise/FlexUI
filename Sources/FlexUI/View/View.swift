public protocol View {
  associatedtype Body: View
  @ViewBuilder var body: Body { get }
  static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs
}

extension Never: View {
  public typealias Body = Never
  public var body: Body {
    fatalError()
  }
}

extension View where Self.Body == Never {
  public var body: Body {
    fatalError()
  }
}

extension View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    assert(Thread.isMainThread)
    assert(Body.self != Never.self)
    let mirror = Mirror(reflecting: view.value)
    mirror
      .children
      .filter({ $0.label != nil })
      .forEach({
        let (label, value) = ($0.label!, $0.value)
        if value is StateProtocol {
          let state = value as! StateProtocol
          let key = view.paths.joined(separator: "/")
          let propertyStorage = inputs.context.storages[key] ?? .init()
          if propertyStorage.properties[label] == nil {
            propertyStorage.properties[label] = state.currentValue()
          }
          state.makeLocation(get: {
            propertyStorage.properties[label]!
          }, set: {
            propertyStorage.properties[label] = $0
          })
          if inputs.context.storages[key] == nil {
            inputs.context.storages[key] = propertyStorage
          }
        }
      })
    var outputs = Body._makeView(view[\.body], inputs)
    mirror
      .children
      .compactMap({ $0.value as? BindingProtocol })
      .map({ $0.getLocation().asObservable() })
      .forEach {
        outputs.observation.append($0)
      }
    mirror
      .children
      .filter({ $0.label != nil && $0.value is StateProtocol })
      .forEach({
        let (label, state) = ($0.label!, $0.value as! StateProtocol)
        if let o = state.getLocation()?.asObservable() {
          outputs.observation.append(o)
        }
      })
    mirror
      .children
      .compactMap({ $0.value as? ObservedObjectProtocol })
      .map({ $0.asObservable() })
      .forEach {
        outputs.observation.append($0)
      }
    return outputs
  }
}

protocol BindingProtocol {
  func getLocation() -> AnyLocationBase
}

extension Binding: BindingProtocol {
  func getLocation() -> AnyLocationBase {
    location
  }
}

protocol StateProtocol {
  func currentValue() -> Any
  func makeLocation(get: @escaping () -> Any, set: @escaping (Any) -> Void)
  func getLocation() -> AnyLocationBase?
}

extension State: StateProtocol {
  func currentValue() -> Any {
    wrappedValue
  }
  func getLocation() -> AnyLocationBase? {
    _location
  }
}

import RxSwift

protocol ObservedObjectProtocol {
  func asObservable() -> Observable<()>
}

extension ObservedObject: ObservedObjectProtocol {
  func asObservable() -> Observable<()> {
    // objectWillChange, before change, so async
    wrappedValue
      .objectWillChange
      .asObservable()
      .map({ _ in () })
  }
}
