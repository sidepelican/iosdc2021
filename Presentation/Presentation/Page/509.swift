import PresentationKit
import SwiftUI

struct Page509Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        TopTitle(title: "その他の改善") {
            Itemize {
                "背景を画像化する。影や角丸の計算をしなくて済む"
                "resizableImageWithCapInsetsで画像を生成して、枠だけを引き伸ばす"
            }

            VStack(spacing: 2) {
                Color(.sRGBLinear, white: 0.75, opacity: 1)
                    .frame(
                        width: context.currentStep == 1 ? 400: 200,
                        height: context.currentStep == 2 ? 300: 200
                    )
                    .cornerRadius(20)
                    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.43), radius: 10)
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }

    func cunningText(step: Int) -> String {
        """
        最後は背景を画像化するっていうテクニックですね。
        角丸や影の部分を最初から計算しておくことで、描画の負荷を減らせます。
        9patchという仕組みで画像の真ん中だけを引き伸ばすことで、レスポンシブにも対応できます。
        resizableImageWithCapInsetsというメソッドを使ったりxcassetsであらかじめ設定しておくと、
        このように画像を引き伸ばすことができるようになります。

        ただこのテクニックはViewの見た目の微調整が難しいというデメリットがあります。
        サービス開発においてはあまり使う機会がないものかもしれません。
        """
    }
}

struct Page509Page_Previews: PreviewProvider {
    static var previews: some View {
        Page509Page()
            .virtualScreenPreview()
    }
}
