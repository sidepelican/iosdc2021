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
}

struct Page601Page_Previews: PreviewProvider {
    static var previews: some View {
        Page601Page()
            .virtualScreenPreview()
    }
}
