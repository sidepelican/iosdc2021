import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page102Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        TopTitle(title: "サンプルアプリケーションの紹介") {
            HSplit(ratio: 0.6) {
                Text("EmojiMania")
                    .padding(.vertical, 16)
                Itemize {
                    "絵文字を一覧表示するアプリ"
                }
                .padding(.bottom, 32)
                if context.currentStep >= 1 {
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

    func cunningText(step: Int) -> String {
        """
        サンプルアプリの、EmojiManiaです。
        このような感じで、絵文字の一覧表示をするアプリになっています。
        （手でスクロールする）
        各セルに角丸だとかシャドウだとかがふんだんに使われていて、リッチなデザインとなっています。

        このアプリ、やっていることはとってもシンプルに見えるんですけど、実際に触ってみるとめっちゃスクロールがザラザラしてしまいます。
        これは大変です、これではユーザさんが気持ちよく操作できません。
        いち早く改善する必要があります。
        """
    }
}

struct Page102Page_Previews: PreviewProvider {
    static var previews: some View {
        Page102Page()
            .virtualScreenPreview()
    }
}
