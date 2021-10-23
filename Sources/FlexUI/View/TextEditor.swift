import UIKit
import YogaKit

public struct TextEditor: View {
  public var text: Binding<String>
  public var update: (UITextField) -> Void
  public init(text: Binding<String>, update: @escaping (UITextField) -> Void) {
    self.text = text
    self.update = update
  }
  public typealias Body = Never
  public static func _makeView(_ view: _GraphValue<TextEditor>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let editor = view.value
    let node = ViewNode(
      name: "TextEditor",
      values: editor.text.wrappedValue) {
      let t = _TextEditor()
      t.yoga.isEnabled = true
      let target = _Target { [editor, weak t] _ in
        if editor.text.wrappedValue != t?.text ?? "" {
          editor.text.wrappedValue = t?.text ?? ""
          t?.yoga.markDirty()
        }
      }
      t._target = target
      t.addTarget(target, action: #selector(_Target._didReceiveEvent(sender:)), for: .valueChanged)
      t.addTarget(target, action: #selector(_Target._didReceiveEvent(sender:)), for: .allEditingEvents)
      return t
    } update: { v, text in
      defer {
        v.yoga.markDirty()
      }
      let t = v as! _TextEditor
      t.text = text
      editor.update(t)
    }
    return _ViewOutputs().then {
      $0.nodes = [node]
    }
  }
}
