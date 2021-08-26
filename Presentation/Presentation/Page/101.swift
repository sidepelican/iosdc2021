import PresentationKit
import SwiftUI

struct Page101Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "描画パフォーマンスを改善する")
    }
}

struct Page101Page_Previews: PreviewProvider {
    static var previews: some View {
        Page101Page()
            .virtualScreenPreview()
    }
}
