import PresentationKit
import SwiftUI

struct Page508Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        TopTitle(title: "その他の改善") {
            Itemize {
                "アルファブレンド（透明）を減らす"
            }
            if context.currentStep == 1 {
                Image("alphacode")
                    .resizable()
                    .scaledToFit()
            }
            if context.currentStep == 2 {
                HSplit {
                    VStack(spacing: 2) {
                        Image("alpha_b")
                            .resizable()
                            .scaledToFit()
                        Text("変更前")
                    }.frame(maxWidth: .infinity, alignment: .center)
                } right: {
                    VStack(spacing: 2) {
                        Image("alpha_c")
                            .resizable()
                            .scaledToFit()
                        Text("変更後")
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        今回はもう完璧な描画速度を達成したのでこれ以上は頑張りませんが、
        他にも使えるテクニックを2つだけ紹介します。

        1つは透明を減らすというテクニックです。透明なViewは描画のときに、下にある色と合成をしないといけないので計算量が増えます。
        また透明レイヤが挟まってると先程紹介したバッチ処理がうまくできなくなります。
        バッチ処理のためには描画をまとめるために描画順を入れ替えるという操作が行われますが、
        間に透明があると描画順を入れ替えることができなくなり、うまく処理をまとめることができなくなります。

        今回のセルでは、このような実装でアルファブレンドを減らせます。
        まずbackgroundColorを透明にしないこと。
        そしてclipToBoundsをtrueにして、自身のboundsの外側に描画がはみ出さないようにすることです。

        このアルファブレンドの様子もシミュレーターのデバッグメニューで確認できます。
        左が変更前で、右が変更後です。
        赤い部分が減ってる事がわかるかと思います。
        これはオフスクリーンレンダリングの削減ほど効果は大きくありませんが、それでも体感できる差を生むことがあります。
        """
    }
}

struct Page508Page_Previews: PreviewProvider {
    static var previews: some View {
        Page508Page()
            .virtualScreenPreview()
    }
}
