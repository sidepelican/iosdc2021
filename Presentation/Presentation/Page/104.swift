import PresentationKit
import SwiftUI

struct Page104Page: Page {
    var body: some View {
        TopTitle(title: "サンプルアプリケーションの動作") {
            HSplit {
                Video(named: "movie_a")
                Text("改善前")
                    .frame(maxWidth: .infinity, alignment: .center)
            } right: {

            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        このような感じになっています。
        今回のiOSDCも事前録画による配信となっているのですけど、これみなさんに伝わっているでしょうか？ちょっと心配はあります。
        ここで今流れてる動画はめっちゃスクロールがザラザラしてるんですけど、
        Zoom越しでこれが録画されて、さらにそれをニコニコ生放送で見るということになるので、もしかしたらフレームレートの関係であんまりよくわからないかもしれませんが、その場合はザラザラしているものだと思いながらこの先見ていってください。
        """
    }
}

struct Page104Page_Previews: PreviewProvider {
    static var previews: some View {
        Page104Page()
            .virtualScreenPreview()
    }
}
