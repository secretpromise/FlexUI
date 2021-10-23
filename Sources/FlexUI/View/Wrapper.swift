public struct Wrapper<Data, Wrapped: View>: View {
  public var data: Data
  @ViewBuilder
  public var content: (Data) -> Wrapped
  public init(data: Data, @ViewBuilder content: @escaping (Data) -> Wrapped) {
    self.data = data
    self.content = content
  }
  public init<T>(data: Binding<T>, @ViewBuilder content: @escaping (Binding<T>, T, @escaping (T) -> Void) -> Wrapped) where Data == Binding<T> {
    self.data = data
    self.content = { (value) in
      content(value, value.wrappedValue, { value.wrappedValue = $0 })
    }
  }
  public init<T>(data: State<T>, @ViewBuilder content: @escaping (State<T>, T, @escaping (T) -> Void) -> Wrapped) where Data == State<T> {
    self.data = data
    self.content = { (value) in
      content(value, value.wrappedValue, { value.wrappedValue = $0 })
    }
  }
  public var body: Wrapped {
    content(data)
  }
}
