import PresentationKit
import SwiftUI

struct Page404Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        TopTitle(title: "改善してみるA") {
            ZStack {
                VStack {
                    Itemize {
                        "layer.shouldRasterize = true を指定すると描画結果を100msキャッシュしてくれる"
                        "レイヤ構造も少し変えて、オフスクリーンなパスが重ならないようにする（描画の並列化）"
                    }
                    Image("code_b")
                        .resizable()
                        .scaledToFit()
                }
                if context.currentStep == 1 {
                    VStack {
                        Image("wwdc14")
                            .resizable()
                            .scaledToFit()
                        Text("Advanced Graphics and Animation for iOS Apps [WWDC14]")
                            .font(.default(size: 28))
                    }
                    .background(Color.white)
                }
            }
        }
    }
}

struct Page404Page_Previews: PreviewProvider {
    static var previews: some View {
        Page404Page()
            .virtualScreenPreview()
    }
}
