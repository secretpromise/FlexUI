extension View {
  fileprivate func makeView(_ paths: [String], _ inputs: _ViewInputs) -> _ViewOutputs {
    Self._makeView(_GraphValue<Self>(value: self, paths: paths + ["\(Self.self)"]), inputs)
  }
}

public struct TupleView<T> {
  internal var value: T
  public typealias Body = Never
  internal typealias Maker = ([String], _ViewInputs) -> _ViewOutputs
  internal var children: [Maker]
  internal init(_ value: T) {
    self.value = value
    self.children = Mirror(reflecting: value).children
      .compactMap {
        ($0.value as? View).map { value -> Maker in
          {
            value.makeView($0, $1)
          }
        }
      }
    assert(self.children.count == Mirror(reflecting: value).children.count)
  }
}

private struct Combine2 {
  var inputs: _ViewInputs
  var outputs: _ViewOutputs
}

extension TupleView: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let _combine = view.value.children.enumerated().reduce(Combine2(inputs: inputs, outputs: _ViewOutputs())) {
      var (combine, (index, block)) = ($0, $1)
      let outputs = block(view.paths + [".\(index)"], combine.inputs)
      combine.outputs.nodes.append(contentsOf: outputs.nodes)
      combine.outputs.observation.append(contentsOf: outputs.observation)
      return combine
    }
    return _combine.outputs
  }
}
