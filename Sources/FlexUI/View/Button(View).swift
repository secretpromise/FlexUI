import UIKit
import YogaKit

extension Button: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let value = view.value
    let node = ViewNode(
      name: "Button",
      valueType: Never.self
    ) {
      let button = _ButtonView(type: .custom)
      button.yoga.isEnabled = true
      defer {
        button.yoga.markDirty()
      }
      let target = _Target { _ in
        value.action()
      }
      button._target = target
      button.addTarget(target, action: #selector(_Target._didReceiveEvent(sender:)), for: .touchUpInside)
      return button
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
}
