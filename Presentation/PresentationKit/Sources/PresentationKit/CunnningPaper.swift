import SwiftUI

public struct CunnningPaper: View {
    @ObservedObject var context: PresentationContext

    public init(context: PresentationContext) {
        self.context = context
    }

    public var body: some View {
        ZStack {
            Text(context.pages[context.currentPageIndex].cunningText)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(16)
                .animation(nil)

            VStack(spacing: 8) {
                HStack {
                    ForEach(0..<context.pages[context.currentPageIndex].stepCount, id: \.self) { i in
                        Text(i <= context.currentStep ? "■" : "□")
                            .font(.title3)
                    }
                }

                Text("\(context.currentPageIndex + 1) / \(context.pages.count)")
                    .font(.title3)
                    .animation(nil)
            }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
            .overlay(KeyboardHandleView())
            .environmentObject(context)
    }
}
