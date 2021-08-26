import PresentationKit
import SwiftUI

struct Page201Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "描画の流れを観察する")
    }
}

struct Page201Page_Previews: PreviewProvider {
    static var previews: some View {
        Page201Page()
            .virtualScreenPreview()
    }
}
