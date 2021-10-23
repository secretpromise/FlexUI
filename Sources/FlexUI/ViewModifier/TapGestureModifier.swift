import UIKit

public struct TapGestureModifier: ViewModifier {
  public typealias Body = Never
  public var tap: TapGesture
  public var action: () -> Void
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    var contents = body(_Graph(), inputs)
    contents.nodes.indices.forEach { index in
      contents.nodes[index].modify { (v, values) in
        let gestures = TapGesture._makeGesture(gesture: modifier[\.tap], inputs: _GestureInputs())
        v.gestureRecognizers?
          .filter({ $0 is FlexUIGesture })
          .forEach(v.removeGestureRecognizer(_:))
        if gestures.nodes.count > 0 {
          v.isUserInteractionEnabled = true
          gestures.nodes.forEach {
            var gesture = $0
            let instance = gesture.makeInstance()
            instance._target?.action = { _ in
              modifier.value.action()
            }
            v.addGestureRecognizer(instance)
          }
        }
      }
    }
    return contents
  }
}

extension View {
  public func onTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> ModifiedContent<Self, TapGestureModifier>  {
    let modifier = TapGestureModifier(tap: TapGesture(count: count), action: action)
    return self.modifier(modifier)
  }
}
