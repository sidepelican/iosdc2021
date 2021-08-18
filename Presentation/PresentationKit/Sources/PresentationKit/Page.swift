import SwiftUI

public protocol AnyPage {
    var stepCount: Int { get }
    var anyBody: AnyView { get }
}

public protocol Page: View, AnyPage {
    var stepCount: Int { get }
}

extension Page {
    public var stepCount: Int { 1 }
    public var anyBody: AnyView {
        AnyView(self)
    }
}
