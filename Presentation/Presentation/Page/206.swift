import PresentationKit
import SwiftUI

private let images: [String] = [
    "flutterDebug1",
    "flutterDebug2",
    "flutterDebug3",
    "flutterDebug3_5",
    "flutterDebug4",
    "flutterDebug5",
    "flutterDebug6",
    "flutterDebug7",
    "flutterDebug8",
    "flutterDebug9",
    "flutterDebug10",
    "flutterDebug11",
    "flutterDebug4",
    "flutterDebug1",
]

struct Page206Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { images.count }

    var body: some View {
        Image(images[context.currentStep])
            .resizable()
            .scaledToFit()
    }

    func cunningText(step: Int) -> String {
        switch step {
        case 0:
            return """
        キャプチャに成功するとこんな感じの画面になります。
        普段見ない画面だと思うんですけどどうですか、結構面白そうじゃないですか？

        この左側に表示されているのがMetalに転送されているコマンドの一覧になってます。
        今回注目するのは描画コマンドなので、描画コマンドだけにフィルタするために、この一番下にある旗みたいなマークを有効にします。
        こうすることで描画コマンド、いわゆるドローコールと呼ばれたりもするんですけど、それだけを表示できます。
"""
        case 1:
            return """
        このドローコールを1つずつ見ていくと、そのタイミングごとの実際の描画が確認できます。
        これ、今中途半端な場所のドローコールを選択しているので中途半端な数のセルが描画されてる様子がわかります。
"""
        case 2:
            return """
        もっと先のほうを見てみると、描画が進んでセルが埋まっていってる様子を確認できます。
"""
        case 3:
            return """
        表示を切り替えると、現在のGPU内のリソースを確認できたりもします。
        これ小さくて見えづらいかもしれないんですけど、Textureってのがいっぱい並んでて、1つ1つのセルがTextureに焼かれている様子を確認できます。
        つまり、Flutterはこの画面を描画するために、一通りすべてのセルの分のテクスチャを作ったあと、それらを順番に並べていくっていう描画戦略がとられているということがわかります。
"""
        case 4:
            return """
        では次に、その1つ1つのセルをテクスチャに焼いていってる部分を見てみましょう。
        このメインの画面に描画しているドローコール郡の前に、ちょこちょこと細かい命令郡があります。
        これらはオフスクリーンレンダリングが行われていて、画面上ではない部分で描画処理をしてテクスチャを作成しています。
        このセル1個1個を描画する部分は、お互いがお互いの描画に干渉することがないので、並列実行されていることがわかります。
        いい感じの図が出ててわかりやすいですね。

        で、このサボテンくんのセルの描画を1ステップずつ見ていきます。
"""
        case 5:
            return """
        まず最初に影が描画されています。
"""
        case 6:
            return """
        その次に背景となる角丸の白いViewが描画されました。
"""
        case 7:
            return """
        余談なんですが、このMetal Debuggerめちゃくちゃ高機能で、こうシェーダの中身だとかどういう頂点が計算されたのかとかを表示できるようになっています。
        この画面の例ですと、いまここで選択しているのは角丸の角の部分の頂点ですね。この描画に使われたフラグメントシェーダがこれになってます。
        フラグメントシェーダっていうのは、簡単に言うと1ドットずつの色を決める部分の関数で、色々な入力を受け取って、1つの色だけを返します。
        フラグメントシェーダをよく見ると、今計算している座標が角丸の扇形の中にいるのか外にいるのか判定して、自身のアルファ値を変更させているという様子を見ることができます。
        面白いですね〜
"""
        case 8:
            return """
        で、次なんですけど、なんとすごいことが起こっています！
        今までは1回のドローコールに1つの図形しか描画されてこなかったですが、なんとこのドローコールでは7個分の図形が一度に描画されています。
        これはどういうことなんでしょうか。
"""
        case 9:
            return """
        この描画に使われたテクスチャを覗いてみると、その仕掛けがわかりました。
        実は複数の図形だと思っていたものは、1つの図形だったんですね〜〜。何を言っているのかわからないと思うんですけど、
        この赤と黒のテクスチャは1次元のテクスチャで、いろんな文字のグリフと、前もってぼかされた絵文字が一緒くたになっています。
        テクスチャってのはでかいスタンプのようなもので、スタンプのどの部分にどんな色のインクをつけるかは完全に自由なんですよね。
        テクスチャの中の離れた部分にある図形を、シェーダを使って空間を捻じ曲げて、いい感じに並び替えたあと一度にポンとスタンプを押してるわけなんですよね。

        これはいわゆるバッチ処理というやつで、複数の描画命令を1つの描画命令にまとめるテクニックとなっています。
"""
        case 10:
            return """
        はい、バッチ処理でガッと描画したあと、最後に色のついたサボテンを描画しておしまいです。
"""
        case 11:
            return """
        このサボテンも、あらかじめテクスチャにまとめられています。先程の2色のテクスチャと違って、絵文字のテクスチャはフルカラーになっています。
"""
        case 12:
            return """
        こうしてサボテンくんのセルが完成して
"""
        case 13:
            return """
        最後にメインのSurfaceに描画される、という流れになっていますね。
        """
        default:
            return ""
        }
    }
}

struct Page206Page_Previews: PreviewProvider {
    static var previews: some View {
        Page206Page()
            .virtualScreenPreview()
    }
}
