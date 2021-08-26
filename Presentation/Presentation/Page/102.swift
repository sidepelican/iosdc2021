import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page102Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        TopTitle(title: "サンプルアプリケーションの紹介") {
            HSplit(ratio: 0.6) {
                Text("EmojiMania")
                    .padding(.vertical, 16)
                if context.currentStep >= 1 {
                    Itemize {
                        "絵文字を一覧表示するアプリ"
                    }
                    .padding(.bottom, 32)
                }
                if context.currentStep >= 2 {
                    Text("課題")
                        .padding(.vertical, 16)
                    Itemize {
                        "スクロールがザラザラする"
                        "文字を表示してるだけなのに😥"
                    }
                }
            } right: {
                DeviceFrame {
                    EmojiListAViewController().wrapped()
                }
            }
        }
    }
}

struct Page102Page_Previews: PreviewProvider {
    static var previews: some View {
        Page102Page()
            .virtualScreenPreview()
    }
}
