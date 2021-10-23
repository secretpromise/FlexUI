import UIKit
import YogaKit

public struct VStack<Content>: View where Content: View {
  internal var content: Content
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  public typealias Body = Never
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    var node = ViewNode(
      name: "VStack",
      valueType: Never.self
    ) {
      let v = _StackView()
      v.yoga.isEnabled = true
      defer {
        v.yoga.markDirty()
      }
      v.yoga.flexDirection = .column
      return v
    }
    let outputs = Content._makeView(view[\.content], inputs)
    node.updateChildren {
      $0 = outputs.nodes
    }
    node.markDirty()
    return _ViewOutputs().then {
      $0.nodes = [node]
      $0.observation = outputs.observation
    }
  }
}
