import PresentationKit
import SwiftUI

struct Page402Page: Page {
    var body: some View {
        TopTitle(title: "改善の前に、計測！") {
            Text("Xcode 12で追加されたAnimation Hitchesを使う")
            Image("animationHitches")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }

    func cunningText(step: Int) -> String {
        """
        さっそく改善！といきたいところなんですけど、改善の前にまずは計測からです。

        今回は計測にはXcode12で追加されたAnimation Hitchesっていうのを使います。
        これは画面がどれくらいカクついてるかを可視化してくれるいいやつです。
        使い方は接続して適当にスクロールするだけです。
        """
    }
}

struct Page402Page_Previews: PreviewProvider {
    static var previews: some View {
        Page402Page()
            .virtualScreenPreview()
    }
}
