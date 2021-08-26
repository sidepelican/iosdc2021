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
}

struct Page204Page_Previews: PreviewProvider {
    static var previews: some View {
        Page204Page()
            .virtualScreenPreview()
    }
}
