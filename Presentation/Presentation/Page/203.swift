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

        こんな感じで、検証のために見た目がほぼ同じアプリをFlutterで作っておきました。

        Flutterは裏でSkiaというマルチプラットフォーム対応のグラフィックAPIを用いています。
        Skiaはマルチプラットフォームに対応しているので多くのバックエンドを取り扱えるようになっていて、
        新しめのiOS環境ではMetalが使用されています。
        つまりMetal Debuggerで観察できるということになります。
        """
    }
}

struct Page203Page_Previews: PreviewProvider {
    static var previews: some View {
        Page203Page()
            .virtualScreenPreview()
    }
}
