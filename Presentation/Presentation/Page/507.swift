import PresentationKit
import SwiftUI

struct Page507Page: Page {
    var body: some View {
        TopTitle(title: "これまでの改善の比較") {
            HSplit {
                Video(named: "movie_a")
                Text("改善前")
                    .frame(maxWidth: .infinity, alignment: .center)
            } right: {
                Video(named: "movie_c")
                Text("改善B")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        実機の動画がこちらです。
        改善前と比べてどうでしょうか？さすがにこれは圧倒的な差が伝わってると思うんですけど
        これ実機はiPhone12miniで最新のスペックの端末なんですけど、それでも左は全然ザラザラしちゃうんですよね。
        端末スペックがどんなに上がっても、重い描画は重いってことがわかると思います。
        """
    }
}

struct Page507Page_Previews: PreviewProvider {
    static var previews: some View {
        Page507Page()
            .virtualScreenPreview()
    }
}
