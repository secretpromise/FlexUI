import UIKit

extension Node where Instance: UIView {
  
  @discardableResult
  mutating func addAllSubviews() -> UIView {
    let view = self.makeInstance()
    if self.isDirty {
      let contentView = transformInstanceCallback?(view) ?? view
      let oldViews = contentView.subviews
      withExtendedLifetime(oldViews) {
        var newViews: [UIView] = []
        updateChildren { children in
          children.indices.forEach { (index) in
            children[index].addAllSubviews()
          }
        }
        newViews = children.map {
          var copy = $0
          let instance = copy.makeInstance()
          return instance
        }
        if newViews != oldViews {
          Set(oldViews).subtracting(newViews).forEach { $0.removeFromSuperview() }
          newViews.forEach(contentView.addSubview(_:))
        }
      }
    }
    return view
  }
  // this will create a view instance ? weak var is not allowed
  mutating func updateAllSubviews() {
    updateChildren { children in
      children.indices.forEach { (index) in
        children[index].updateAllSubviews()
      }
    }
    updateInstanceIfNeeded()
  }
}

typealias ViewNode = Node<UIView>
