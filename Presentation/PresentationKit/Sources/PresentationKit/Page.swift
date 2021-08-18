import SwiftUI

public protocol AnyPage {
    var stepCount: Int { get }
    var anyBody: AnyView { get }
    var cunningText: String { get }
}

public protocol Page: View, AnyPage {
    var stepCount: Int { get }
    var cunningText: String { get }
}

extension Page {
    public var stepCount: Int { 1 }
    public var anyBody: AnyView {
        AnyView(self)
    }
    public var cunningText: String { "" }
}
