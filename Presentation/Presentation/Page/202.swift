import PresentationKit
import SwiftUI

struct Page202Page: Page {
    var body: some View {
        TopTitle(title: "描画の流れを観察する") {
            Text("描画の雰囲気を知る")
            Itemize {
                "Metal Debuggerを使うと描画の流れを追うことができる"
                "ただし、UIKitは観察できない😢"
            }
            .padding(.bottom, 32)
            Text("そこで今回は")
            Itemize {
                "Flutterを使って描画の流れを観察"
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        描画の流れを観察するにはどうすればいいでしょうか。
        Xcodeには、Metal Debuggerというものが用意されていて、アプリがMetalをどのように使用しているかを調べることができます。
        Metalとは低レイヤのグラフィックAPIで、画面描画よく用いられています。
        このMetal Debuggerは、どういうわけかUIKitの挙動を観察することはできないんですよね。
        UIKitも裏でMetalを使っていると思うんですけど確認できないのでどうしようない、ということになっています。

        そこで今回は、Fluteを使ってこのMetal Debuggerを動かしていきたいと思います。
        """
    }
}

struct Page202Page_Previews: PreviewProvider {
    static var previews: some View {
        Page202Page()
            .virtualScreenPreview()
    }
}
