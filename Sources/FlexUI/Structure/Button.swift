public struct Button<Label> : View where Label : View {
  var action: () -> Void
  var label: Label
  public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
    self.action = action
    self.label = label()
  }
}

extension Button where Label == Text {
  public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
    self.init(action: action) {
      Text(titleKey, tableName: nil, bundle: nil, comment: nil)
    }
  }
  public init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol {
    self.init(action: action) {
      Text(title)
    }
  }
}

extension Button where Label == PrimitiveButtonStyleConfiguration.Label {
  public init(_ configuration: PrimitiveButtonStyleConfiguration) {
    self.init {
      configuration.trigger()
    } label: {
      configuration.label
    }
  }
}

extension Button {
  public init(role: ButtonRole?, action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
    self.init(action: action, label: label)
  }
}

extension Button where Label == Text {
  public init(_ titleKey: LocalizedStringKey, role: ButtonRole?, action: @escaping () -> Void) {
    self.init(role: role, action: action) {
      Text(titleKey, tableName: nil, bundle: nil, comment: nil)
    }
  }
  public init<S>(_ title: S, role: ButtonRole?, action: @escaping () -> Void) where S : StringProtocol {
    self.init(role: role, action: action) {
      Text(title)
    }
  }
}
