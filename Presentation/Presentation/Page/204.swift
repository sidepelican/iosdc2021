import PresentationKit
import SwiftUI

struct Page204Page: Page {
    var body: some View {
        TopTitle(title: "Metal Debuggerを有効にする") {
            Image("gpuFrameCapture")
                .resizable()
                .scaledToFit()
        }
    }

    func cunningText(step: Int) -> String {
        """
        Metal Debuggerを有効にするには、RunスキームのOptionsってとこにある、
        GPU Frame Caputureという項目でMetalを選択することで使用可能になります。

        ここデフォルトだとAutomaticみたいなのが選択されてるんですけど、
        Automaticだと何故かうまくいかないので、ちゃんと明示的にMetalを選択します。
        """
    }
}

struct Page204Page_Previews: PreviewProvider {
    static var previews: some View {
        Page204Page()
            .virtualScreenPreview()
    }
}
