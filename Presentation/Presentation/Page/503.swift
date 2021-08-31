import PresentationKit
import SwiftUI

struct Page503Page: Page {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("改善してみるB")
                .lineLimit(1)
                .font(.default(size: 64).weight(.heavy))
                .minimumScaleFactor(0.7)
                .padding(.horizontal, 52)
                .padding(.top, 44)
                .padding(.bottom, 40)
            Image("code_c")
                .resizable()
                .scaledToFit()
            Spacer()
        }
    }

    func cunningText(step: Int) -> String {
        """
        コードはこんな感じです。

        角丸のshadowPathはlayoutSubviewsのタイミングで毎回与えるようにしています。
        CGPathにこれ専用のイニシャライザがあって結構便利です。

        絵文字ラベルのほうは、このconfigureってメソッドはセルにデータをバインドする関数なんですけど、
        ここはちょっと面倒ですが毎回NSShadowを設定しています。
        """
    }
}

struct Page503Page_Previews: PreviewProvider {
    static var previews: some View {
        Page503Page()
            .virtualScreenPreview()
    }
}
