import PresentationKit
import SwiftUI

struct Page203Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        TopTitle(title: "描画の流れを観察する") {
            HSplit(ratio: 0.7) {
                Text("Flutter")
                if context.currentStep >= 1 {
                    Itemize {
                        "描画にSkiaを使用"
                        "SkiaはさらにMetalに対応している"
                    }
                    Text("→ Metal Debuggerで観察できる")
                }
            } right: {
                Image("flutterEmojiMania")
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        Flutterについてですが、もうすでに十分広まっていると思うので説明は省略させて頂きます。

        Flutterは裏でSkiaというマルチプラットフォーム対応のグラフィックAPIを用いています。
        Skiaはマルチプラットフォームに対応しているので多くのバックエンドを取り扱えるようになっていて、
        新しめのiOS環境ではMetalが使用されています。
        つまりMetal Debuggerで観察できるということになります。

        こんな感じで、見た目がほぼ同じアプリをFlutterで作っておきました。
        では、実際のこのFlutterアプリを観察していきましょう。
        """
    }
}

struct Page203Page_Previews: PreviewProvider {
    static var previews: some View {
        Page203Page()
            .virtualScreenPreview()
    }
}
