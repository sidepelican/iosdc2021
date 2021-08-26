import PresentationKit
import SwiftUI

struct Page503Page: Page {
    var body: some View {
        TopTitle(title: "改善してみるB") {
            Image("code_c")
                .resizable()
                .scaledToFit()
        }
    }
}

struct Page503Page_Previews: PreviewProvider {
    static var previews: some View {
        Page503Page()
            .virtualScreenPreview()
    }
}
