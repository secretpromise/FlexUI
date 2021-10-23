import UIKit
import YogaKit

extension Image: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let node = ViewNode(
      name: "Image",
      values: view.value) {
      let v = _ImageView()
      v.yoga.isEnabled = true
      return v
    } update: { v, values in
      defer {
        v.yoga.markDirty()
      }
      let imageView = v as!  _ImageView
      imageView.image = view.value.nativeValue()
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
}
