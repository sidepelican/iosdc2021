import PresentationKit
import SwiftUI

struct Page301Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "オフスクリーンレンダリングについて")
    }

    func cunningText(step: Int) -> String {
        """
        描画の観察がおわったところで、
        次はオフスクリーンレンダリングの解説になります
        """
    }
}

struct Page301Page_Previews: PreviewProvider {
    static var previews: some View {
        Page301Page()
            .virtualScreenPreview()
    }
}
