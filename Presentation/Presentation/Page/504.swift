import EmojiManiaScenes
import PresentationKit
import SwiftUI

struct Page504Page: Page {
    var body: some View {
        TopTitle(title: "改善してみるB") {
            HSplit(ratio: 0.3) {
                DeviceFrame {
                    EmojiListCViewController().wrapped()
                }
            } right: {
                Itemize {
                    "オフスクリーンレンダリング領域の変化"
                }
                HStack(alignment: .bottom) {
                    Text("改善A")
                        .font(.default(size: 32)).fontWeight(.light)
                    Image("offscreen_b")
                        .resizable()
                        .scaledToFit()
                    Text("→")
                        .frame(maxHeight: .infinity, alignment: .center)
                    Image("offscreen_c")
                        .resizable()
                        .scaledToFit()
                    Text("改善B")
                        .font(.default(size: 32)).fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct Page504Page_Previews: PreviewProvider {
    static var previews: some View {
        Page504Page()
            .virtualScreenPreview()
    }
}
