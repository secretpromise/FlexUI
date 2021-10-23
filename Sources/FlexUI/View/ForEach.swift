public struct ForEach<Data, ID, Content> where Data: RandomAccessCollection, ID: Hashable {
  public var data: Data
  public var content: (Data.Element) -> Content
  public typealias Body = Never
}

extension ForEach where Content: View {
  public init(
    _ data: Data,
    id: KeyPath<Data.Element, ID>,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) {
    self.data = data
    self.content = content
  }
}
extension ForEach where ID == Data.Element.ID, Content : View, Data.Element : Identifiable {
  public init(
    _ data: Data,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) {
    self.init(data, id: \Data.Element.id, content: content)
  }
}
extension ForEach where Data == Range<Int>, ID == Int, Content : View {
  public init(
    _ data: Range<Int>,
    @ViewBuilder content: @escaping (Int) -> Content
  ) {
    self.init(data, id: \Int.self, content: content)
  }
}
private struct Combine2 {
  var inputs: _ViewInputs
  var outputs: _ViewOutputs
}

extension ForEach: View where Content: View {
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    let _combine = view.value.data.enumerated().reduce(Combine2(inputs: inputs, outputs: _ViewOutputs())) {
      var (combine, (index, data)) = ($0, $1)
      let outputs = Content._makeView(view.branch(view.value.content(data), [".\(index)", "\(Content.self)"]), combine.inputs)
      combine.outputs.nodes.append(contentsOf: outputs.nodes)
      combine.outputs.observation.append(contentsOf: outputs.observation)
      return combine
    }
    return _combine.outputs
  }
}
