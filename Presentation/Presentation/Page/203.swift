import PresentationKit
import SwiftUI

struct Page203Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        TopTitle(title: "描画の流れを観察する") {
            HSplit(ratio: 0.7) {
                Text("Flutter")
                if context.currentStep >= 1 {
                    Itemize {
                        "描画にSkiaを使用"
                        "SkiaはさらにMetalに対応している"
                    }
                    Text("→ Metal Debuggerで観察できる")
                }
            } right: {
                Image("flutterEmojiMania")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct Page203Page_Previews: PreviewProvider {
    static var previews: some View {
        Page203Page()
            .virtualScreenPreview()
    }
}
