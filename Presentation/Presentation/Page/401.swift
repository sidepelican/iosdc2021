import PresentationKit
import SwiftUI

struct Page401Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "サンプルアプリを改善する")
    }
}

struct Page401Page_Previews: PreviewProvider {
    static var previews: some View {
        Page401Page()
            .virtualScreenPreview()
    }
}
