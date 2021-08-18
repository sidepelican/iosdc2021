import SwiftUI

struct ResumeFromLastPage<Content: View>: View {
    @EnvironmentObject var context: PresentationContext
    @AppStorage("currentPageIndex") var currentPageIndex: Int = 0

    var content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .onAppear {
                context.currentPageIndex = min(context.pages.count - 1, currentPageIndex)
            }
            .onChange(of: context.currentPageIndex, perform: { value in
                currentPageIndex = value
            })
    }
}
