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
        }
    }
}

struct Page601Page_Previews: PreviewProvider {
    static var previews: some View {
        Page601Page()
            .virtualScreenPreview()
    }
}
