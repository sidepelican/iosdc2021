import PresentationKit
import SwiftUI

struct Page301Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "オフスクリーンレンダリングについて")
    }
}

struct Page301Page_Previews: PreviewProvider {
    static var previews: some View {
        Page301Page()
            .virtualScreenPreview()
    }
}
