import UIKit
import YogaKit

public struct _BackgroundModifier<Background: View>: ViewModifier {
  public typealias Body = Never
  public let background: Background
  public init(_ background: Background) {
    self.background = background
  }
  public static func _modifyContent(_ modifier: _GraphValue<Self>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    let contents = body(_Graph(), inputs)
    let nodes = contents.nodes.map { content -> ViewNode in
      let backgrounds = Background._makeView(modifier[\.background], inputs)
      return backgrounds.nodes.reduce(content) {
        var (content, background) = ($0, $1)
        background.updateChildren {
          $0 = [content]
        }
        background.markDirty()
        return background
      }
    }
    return _ViewOutputs().then {
      $0.nodes = nodes
      $0.observation = contents.observation
    }
  }
}

extension View {
  public func background<Background: View>(_ background: Background) -> ModifiedContent<Self, _BackgroundModifier<Background>> {
    modifier(_BackgroundModifier(background))
  }
}
