import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page405Page: Page {
    var body: some View {
        TopTitle(title: "改善してみるA") {
            HSplit(ratio: 0.3) {
                DeviceFrame {
                    EmojiListBViewController().wrapped()
                }
            } right: {
                Itemize {
                    "オフスクリーンレンダリング領域の変化"
                }
                HStack(alignment: .bottom) {
                    Text("初期状態")
                        .font(.default(size: 32)).fontWeight(.light)
                    Image("offscreen_a")
                        .resizable()
                        .scaledToFit()
                    Text("→")
                        .frame(maxHeight: .infinity, alignment: .center)
                    Image("offscreen_b")
                        .resizable()
                        .scaledToFit()
                    Text("改善A")
                        .font(.default(size: 32)).fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        こうした改善を重ねた結果、どうでしょうか。
        （シュッシュしながら）スクロールはかなりなめらかになったような気がします。キャッシュが効いてそうです。

        オフスクリーンレンダリング領域は少し減りました。まだ黄色い感じはしますね。
        （シュッシュしながら）とはいえ体感できるくらい速くなりました。

        さて、計測してみるとどうなるでしょうか
        """
    }
}

struct Page405Page_Previews: PreviewProvider {
    static var previews: some View {
        Page405Page()
            .virtualScreenPreview()
    }
}
