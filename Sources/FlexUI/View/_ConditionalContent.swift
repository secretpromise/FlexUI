public struct _ConditionalContent<TrueContent, FalseContent> {
  public typealias Body = Never
  public enum Storage {
    case trueContent(TrueContent)
    case falseContent(FalseContent)
  }
  public var storage: Storage
  init(storage: Storage) {
    self.storage = storage
  }
}

extension _ConditionalContent: View where TrueContent: View, FalseContent: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    switch view.value.storage {
    case .trueContent(let a):
      return TrueContent._makeView(view.branch(a), inputs)
    case .falseContent(let b):
      return FalseContent._makeView(view.branch(b), inputs)
    }
  }
}

extension _ConditionalContent: ViewModifier where TrueContent: ViewModifier, FalseContent: ViewModifier {
  public static func _modifyContent(_ modifier: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, _ inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
    switch modifier.value.storage {
    case .trueContent(let a):
      return TrueContent._modifyContent(modifier.branch(a), inputs, body: body)
    case .falseContent(let b):
      return FalseContent._modifyContent(modifier.branch(b), inputs, body: body)
    }
  }
}
