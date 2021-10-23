import UIKit
import YogaKit

public protocol UIViewRepresentable: View where Self.Body == Never {
  associatedtype UIViewType: UIKit.UIView
  associatedtype Coordinator = Void
  typealias Context = UIViewRepresentableContext<Self>
  func makeUIView(context: Self.Context) -> Self.UIViewType
  func updateUIView(_ uiView: Self.UIViewType, context: Self.Context)
  static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator)
  func makeCoordinator() -> Self.Coordinator
}

public struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable {
  public let coordinator: Representable.Coordinator
}

extension UIViewRepresentable where Self.Coordinator == Void {
  public func makeCoordinator() -> Self.Coordinator {
    
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let context = Self.Context(coordinator: ())
    let node = ViewNode(
      name: "\(type(of: self))",
      values: view.paths
    ) {
      let v = view.value.makeUIView(context: context)
      return v
    } update: { v, Values in
      view.value.updateUIView(v as! Self.UIViewType, context: context)
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
  public func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) {
    
  }
  public static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) {
    
  }
}
