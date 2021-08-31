import PresentationKit
import SwiftUI

struct Page501Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "さらなる改善へ")
    }

    func cunningText(step: Int) -> String {
        """
        さらなる改善へ
        """
    }
}

struct Page501Page_Previews: PreviewProvider {
    static var previews: some View {
        Page501Page()
            .virtualScreenPreview()
    }
}
