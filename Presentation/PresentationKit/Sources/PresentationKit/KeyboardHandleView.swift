import SwiftUI

struct KeyboardHandleView: View {
    @EnvironmentObject var context: PresentationContext

    var body: some View {
        ZStack {
            Button(action: {
                self.context.handleStep(.back)
            }, label: EmptyView.init)
            .keyboardShortcut(.leftArrow, modifiers: [])

            Button(action: {
                self.context.handleStep(.forward)
            }, label: EmptyView.init)
            .keyboardShortcut(.rightArrow, modifiers: [])
        }
        .hidden()
    }
}
