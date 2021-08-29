import PresentationKit
import SwiftUI

struct Page103Page: Page {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("サンプルアプリのセルの実装")
                    .lineLimit(1)
                    .font(.default(size: 64).weight(.heavy))
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal, 52)
                Image("code_a")
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        （縦にスクロールできる）
        こちらがサンプルアプリのセルの実装になります。
        contentView.layerに影を指定して、
        角丸の背景Viewを置いて
        その上にStackViewでラベルを並べているという、とてもごくありふれた実装になっています。
        ここで絵文字のラベルにも影がついてたりします。
        一見問題はなさそうですね。でも、実際の動きはというと
        """
    }
}

struct Page103Page_Previews: PreviewProvider {
    static var previews: some View {
        Page103Page()
            .virtualScreenPreview()
    }
}
