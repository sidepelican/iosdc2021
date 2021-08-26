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
}

struct Page202Page_Previews: PreviewProvider {
    static var previews: some View {
        Page202Page()
            .virtualScreenPreview()
    }
}
