import PresentationKit
import SwiftUI

struct Page205Page: Page {
    var body: some View {
        TopTitle(title: "実際にCapture GPU Frameする") {
            Text("実機でデバッグ実行し、このボタン􀌞を押す")
            HStack {
                Spacer()
                Image("runFrameCapture")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            Text("ボタンを押して次に描画されるフレームがキャプチャされる")
        }
    }

    func cunningText(step: Int) -> String {
        """
        スキームの設定が終わったら
        実機でアプリを起動して、このカメラっぽいボタンを押します。
        押してその次に描画されるフレームがキャプチャされます。
        """
    }
}

struct Page205Page_Previews: PreviewProvider {
    static var previews: some View {
        Page205Page()
            .virtualScreenPreview()
    }
}
