import SwiftUI

public protocol AnyPage {
    var stepCount: Int { get }
    var anyView: AnyView { get }
    func cunningText(step: Int) -> String
}

public protocol Page: View, AnyPage {
    var stepCount: Int { get }
    func cunningText(step: Int) -> String
}

extension Page {
    public var stepCount: Int { 1 }
    public var anyView: AnyView {
        AnyView(self)
    }
    public func cunningText(step: Int) -> String  { "" }
}
