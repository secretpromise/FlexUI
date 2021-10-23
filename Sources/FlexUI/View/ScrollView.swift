import UIKit
import YogaKit

public struct ScrollView<Content: View>: View {
  public typealias Body = Never
  public var content: Content
  public var axes: Axis.Set
  public var showsIndicators: Swift.Bool
  public init(_ axes: Axis.Set = .vertical, showsIndicators: Swift.Bool = true, @ViewBuilder content: () -> Content) {
    self.axes = axes
    self.showsIndicators = showsIndicators
    self.content = content()
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    var node = ViewNode(
      name: "ScrollView",
      valueType: Never.self
    ) {
      let v = _ScrollView()
      v.yoga.isEnabled = true
      defer {
        v.yoga.markDirty()
      }
      if view.value.axes.contains(.horizontal) {
        v.showsHorizontalScrollIndicator = view.value.showsIndicators
      }
      if view.value.axes.contains(.vertical) {
        v.showsVerticalScrollIndicator = view.value.showsIndicators
      }
      return v
    } transform: {
      ($0 as! _ScrollView).contentView
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
