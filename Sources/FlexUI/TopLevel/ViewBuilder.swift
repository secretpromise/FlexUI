@resultBuilder
public struct ViewBuilder {
  public static func buildBlock() -> EmptyView {
    EmptyView()
  }
  public static func buildBlock<Component: View>(_ component: Component) -> Component {
    component
  }
  public static func buildEither<TrueContent: View, FalseContent: View>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .trueContent(first))
  }
  public static func buildEither<TrueContent: View, FalseContent: View>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .falseContent(second))
  }
  public static func buildOptional<Component: View>(_ component: Component?) -> Component? {
    component
  }
  public static func buildExpression<Component: View>(_ expression: Component) -> Component {
    expression
  }
}

@resultBuilder
public struct ViewModifierBuilder {
  public static func buildBlock() -> EmptyViewModifier {
    EmptyViewModifier.identity
  }
  public static func buildBlock<Component: ViewModifier>(_ component: Component) -> Component {
    component
  }
  public static func buildEither<TrueContent: ViewModifier, FalseContent: ViewModifier>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .trueContent(first))
  }
  public static func buildEither<TrueContent: ViewModifier, FalseContent: ViewModifier>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .falseContent(second))
  }
  public static func buildExpression<Component: ViewModifier>(_ expression: Component) -> Component {
    expression
  }
}

extension ViewBuilder {
  public static func buildLimitedAvailability<Content : View>(_ content: Content) -> AnyView  {
    AnyView(view: content)
  }
}

extension ViewBuilder {
  public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)>
  where C0: View, C1: View {
    TupleView((c0, c1))
  }
  public static func buildBlock<C0: View, C1: View, C2: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2
  ) -> TupleView<(C0, C1, C2)> {
    TupleView((c0, c1, c2))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3
  ) -> TupleView<(C0, C1, C2, C3)> {
    TupleView((c0, c1, c2, c3))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4
  ) -> TupleView<(C0, C1, C2, C3, C4)> {
    TupleView((c0, c1, c2, c3, c4))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4,
    _ c5: C5
  ) -> TupleView<(C0, C1, C2, C3, C4, C5)> {
    TupleView((c0, c1, c2, c3, c4, c5))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4,
    _ c5: C5,
    _ c6: C6
  ) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)> {
    TupleView((c0, c1, c2, c3, c4, c5, c6))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4,
    _ c5: C5,
    _ c6: C6,
    _ c7: C7
  ) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)> {
    TupleView((c0, c1, c2, c3, c4, c5, c6, c7))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4,
    _ c5: C5,
    _ c6: C6,
    _ c7: C7,
    _ c8: C8
  ) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> {
    TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8))
  }
  public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View>(
    _ c0: C0,
    _ c1: C1,
    _ c2: C2,
    _ c3: C3,
    _ c4: C4,
    _ c5: C5,
    _ c6: C6,
    _ c7: C7,
    _ c8: C8,
    _ c9: C9
  ) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> {
    TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
  }
}
