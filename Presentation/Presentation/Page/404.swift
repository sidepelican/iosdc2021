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

    func cunningText(step: Int) -> String {
        """
        では、ここから改善していきましょう。
        適当に拾ってきた知識から、使えそうなものを適用してみます。

        layer.shouldRasterizeをtrueにすると実は描画結果を100msだけキャッシュしてくれます。
        この100msってのどこに書いてあるんだっていう話なんですけど、実は2014年のWWDCで言及されてました。

        他には、レイヤ構造を少し変えてオフスクリーンレンダリングなパスが重ならないようにします。
        具体的にはこのような形で、影専用のUIViewを用意してそれを一番下に差し込むっていう感じにしています。
        こうすることで、絵文字部分の描画を待たずとも影レイヤのレンダリングができるようになります。
        """
    }
}

struct Page404Page_Previews: PreviewProvider {
    static var previews: some View {
        Page404Page()
            .virtualScreenPreview()
    }
}
