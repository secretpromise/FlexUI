public struct IDView<Content: View, ID: Hashable>: View {
  public typealias Body = Never
  public let content: Content
  public let id: ID
  public init(content: Content, id: ID) {
    self.content = content
    self.id = id
  }
  public static func _makeView(_ view: _GraphValue<Self>, _ inputs: _ViewInputs) -> _ViewOutputs {
    Content._makeView(view[\.content], inputs)
  }
}

extension View {
  public func id<ID: Hashable>(_ id: ID) -> IDView<Self, ID> {
    IDView(content: self, id: id)
  }
}
