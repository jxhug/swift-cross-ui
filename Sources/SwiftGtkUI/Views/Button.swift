/// A button view.
public struct Button: View {
    public var model = EmptyViewModel()
    
    /// The button's label.
    public var label: String
    /// The action to run when the button is clicked.
    public var action: () -> Void
    
    public var body = EmptyViewContent()
    
    /// Creates a new button.
    public init(_ label: String, action: @escaping () -> Void = { }) {
        self.label = label
        self.action = action
    }
    
    public func asWidget(_ children: EmptyViewContent.Children) -> GtkWidget {
        let widget = GtkButton()
        widget.label = label
        widget.clicked = { _ in action() }
        return widget
    }
    
    public func update(_ widget: GtkWidget) {
        let button = widget as! GtkButton
        button.label = label
        button.clicked = { _ in action() }
    }
}
