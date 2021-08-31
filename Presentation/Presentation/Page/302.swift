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
                            "重い傾向にある"
                        }
                    } else {
                        Itemize {
                            "iOSでは影の描画でよく使われる"
                            "「Color Off-screen Rendered」で可視化可能"
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

    func cunningText(step: Int) -> String {
        """
        オフスクリーンレンダリングについて、今回は画面に表示しない領域で行う、裏方的な描画と表現させて頂きます。
        先程の観察でも出てきていて、サボテンのセルを作っていた部分です。
        このオフスクリーンレンダリングなんですが、私はGPUの実装に詳しくないので厳密なことは言えないのですけど、経験上iOS環境においては重い処理となっています。
        オフスクリーンレンダリングを減らして描画を高速化しようという話は古くから伝えられていて、WWDC2011でも言及されています。

        iOS環境においては影の描画でよく発生します。
        この画像の中の黄色い部分がオフスクリーンレンダリングが使われている場所になります。
        これはシミュレーターに可視化するデバッグメニューがあります。

        ちなみに今回のアプリでこれを確認すると、このように全体が真っ黄色になっていて最悪であることがわかると思います。
        """
    }
}

struct Page302Page_Previews: PreviewProvider {
    static var previews: some View {
        Page302Page()
            .virtualScreenPreview()
    }
}
