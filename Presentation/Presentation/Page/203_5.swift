import PresentationKit
import SwiftUI

struct Page203_5Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 4 }

    var body: some View {
        TopTitle(title: "FlutterがどうやってUIを描画しているか") {
            switch context.currentStep {
            case 0:
                Itemize {
                    "React Nativeと違って、Flutterは独自の描画エンジンを使っている"
                    "UIKitから見たら1枚のViewしかない"
                }
            case 1:
                Image("layers_uikit")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, alignment: .center)
            case 2:
                Image("layers_flutter")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, alignment: .center)
            default:
                Itemize {
                    "React Nativeと違って、Flutterは独自の描画エンジンを使っている"
                    "UIKitから見たら1枚のViewしかない"
                    "ゲームアプリと同じ構成"
                    "マルチプラットフォームに強いが、ネイティブと挙動を揃えるためにかなり頑張られている"
                }
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        先程Flutterは描画にSkiaを使っていると述べましたが、それだけではよくわからないと思うのでもう少し補足しておきます。

        FlutterはReact Nativeと違って、独自のUI描画の仕組みを持っています。
        ネイティブであるUIKitの実装をほとんど使っていないので、UIKit的には1枚だけのViewに見えています。その1枚のViewに、めちゃくちゃお絵かきをしてUIを構築しています。

        （めくって）ネイティブのアプリはこういう感じでUIViewが何層にも重なった感じになってるんですけど、
        （めくって）こう、Flutterは1枚しかないんですよね。この真っ黒の1枚の上に、独自の描画エンジンでめちゃくちゃお絵かきしています。

        （めくって）
        これ実はゲームアプリと同じ構成なんですよね。
        Flutterはマルチプラットフォームをうたっていると思いますが、そのプラットフォーム間におけるUIの安定性この仕組みから来ています。
        ゲームアプリもそうですよね。ゲームアプリもプラットフォームをまたいでほぼ同じUIを提供していると思います。
        この方式はマルチプラットフォームには強いんですけど、やっぱりどうしてもネイティブのコンポーネントを使ってないという点で、ネイティブのUIと連携したり、挙動を揃えるには苦労すると思います。
        しかしながらFlutterは結構公式が頑張ってくれていて、そんなに苦労しなくてもかなりネイティブに近い挙動を提供できるようなってると思います。
        またネイティブのコンポーネントを使わないってのにも良い点があると思って、UIKitの謎の仕様変更に振り回されなくて済むんですよね。去年とかだとUIStackViewの背景色の問題とか、今年だといつものごとくNavigationBarの仕様変更だとか、まあいろんな振り回されがあるんで、それらを無視できるのは実は結構なメリットかもしれません。

        まあ、Flutterの話は今回の本質ではないのでこれくらいにして、実際にMetal Debuggerを使って描画を観察していきたいと思います。
        """
    }
}

struct Page203_5Page_Previews: PreviewProvider {
    static var previews: some View {
        Page203_5Page()
            .virtualScreenPreview()
    }
}
