import SwiftUI
import EmojiManiaScenes
import PresentationKit

struct HelloPage: View, Page {
    var body: some View {
        Text("Hello")
    }

    func cunningText(step: Int) -> String {
        "Hello"
    }
}

struct HelloWorldPage: View, Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        ZStack {
            context.currentStep >= 1 ? Color.gray : Color.primary
            HStack {
                ForEach(0...context.currentStep, id: \.self) { i in
                    DeviceFrame {
                        switch i {
                        case 0:
                            EmojiListAViewController().wrapped()
                        case 1:
                            EmojiListBViewController().wrapped()
                        case 2:
                            EmojiListCViewController().wrapped()
                        default:
                            EmptyView()
                        }
                    }
                }
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        Hello World
        -----------
        こんにちは世界
        """
    }
}
