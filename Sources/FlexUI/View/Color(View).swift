import UIKit
import YogaKit

extension Color: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let color = _ColorView()
    color.backgroundColor = view.value.nativeValue()
    let node = ViewNode(
      name: "Color",
      values: view.value) {
      let v = _ColorView()
      v.yoga.isEnabled = true
      return v
    } update: { v, color in
      defer {
        v.yoga.markDirty()
      }
      v.backgroundColor = color.nativeValue()
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
}
