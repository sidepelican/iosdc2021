import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page405Page: Page {
    var body: some View {
        TopTitle(title: "改善してみるA") {
            HSplit(ratio: 0.3) {
                DeviceFrame {
                    EmojiListBViewController().wrapped()
                }
            } right: {
                Itemize {
                    "オフスクリーンレンダリング領域の変化"
                }
                HStack(alignment: .bottom) {
                    Text("初期状態")
                        .font(.default(size: 32)).fontWeight(.light)
                    Image("offscreen_a")
                        .resizable()
                        .scaledToFit()
                    Text("→")
                        .frame(maxHeight: .infinity, alignment: .center)
                    Image("offscreen_b")
                        .resizable()
                        .scaledToFit()
                    Text("改善A")
                        .font(.default(size: 32)).fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct Page405Page_Previews: PreviewProvider {
    static var previews: some View {
        Page405Page()
            .virtualScreenPreview()
    }
}
