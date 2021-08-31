import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page506Page: Page {
    var body: some View {
        TopTitle(title: "これまでの改善の比較") {
            HStack {
                VStack(spacing: 2) {
                    DeviceFrame {
                        EmojiListAViewController().wrapped()
                    }
                    Text("改善前")
                        .font(.default(size: 32))
                }
                VStack(spacing: 2) {
                    DeviceFrame {
                        EmojiListBViewController().wrapped()
                    }
                    Text("改善A")
                        .font(.default(size: 32))
                }
                VStack(spacing: 2) {
                    DeviceFrame {
                        EmojiListCViewController().wrapped()
                    }
                    Text("改善B")
                        .font(.default(size: 32))
                }
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        これが、これまでの改善結果の比較になります。
        スライド上だとよくわからないので次にいきます。
        """
    }
}

struct Page506Page_Previews: PreviewProvider {
    static var previews: some View {
        Page506Page()
            .virtualScreenPreview()
    }
}
