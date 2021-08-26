import PresentationKit
import SwiftUI

struct Page302Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        TopTitle(title: "オフスクリーンレンダリング") {
            HStack {
                VStack(spacing: 2) {
                    if context.currentStep == 0 {
                        Itemize {
                            "画面に表示しない領域で行う、裏方作業的な描画"
                            "iOSでは影の描画でよく使われる"
                        }
                    } else {
                        Itemize {
                            "シミュレーターの「Color Off-screen Rendered」メニューで可視化可能"
                        }
                    }
                    Image("session121")
                        .resizable()
                        .scaledToFit()
                    Text("Understanding UIKit Rendering [WWDC11]")
                        .font(.default(size: 28))
                }
                if context.currentStep >= 2 {
                    VStack(spacing: 0) {
                        Image("offscreen_a")
                            .resizable()
                            .scaledToFit()
                        Text("今回のアプリ")
                            .font(.default(size: 28))
                    }
                }
            }
        }
    }
}

struct Page302Page_Previews: PreviewProvider {
    static var previews: some View {
        Page302Page()
            .virtualScreenPreview()
    }
}
