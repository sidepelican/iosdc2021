import PresentationKit
import SwiftUI

struct Page601Page: Page {
    var body: some View {
        TopTitle(title: "まとめ") {
            Itemize {
                "Flutterを用いてUI描画の流れを確認した"
                "影の利用がオフスクリーンレンダリングをもたらす流れを確認した"
                "Animation Hitchesを確認しながら速度改善した"
            }

            Spacer()
            Text("今回のサンプルアプリ実装")
            Text("https://github.com/sidepelican/iosdc2021/tree/main/EmojiMania")
                .font(.custom("courier", size: 30))
        }
    }

    func cunningText(step: Int) -> String {
        """
        まとめですが、本日は
        Flutterを用いてUI描画の流れを確認しました。
        影の利用がオフスクリーンレンダリングをもたらすってことを理解できたかと思います。
        Animation Hitchesを確認しながら速度改善することができました。

        今回のスクロールがザラツくサンプルアプリはここのリポジトリにあるので、興味のある方は触ってみてください。
        以上で発表をおわります。
        """
    }
}

struct Page601Page_Previews: PreviewProvider {
    static var previews: some View {
        Page601Page()
            .virtualScreenPreview()
    }
}
