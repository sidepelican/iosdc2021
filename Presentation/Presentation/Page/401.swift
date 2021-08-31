import PresentationKit
import SwiftUI

struct Page401Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "サンプルアプリを改善する")
    }

    func cunningText(step: Int) -> String {
        """
        さて、前提知識が色々溜まってきたところで、いよいよサンプルアプリの改善に入りたいと思います
        """
    }
}

struct Page401Page_Previews: PreviewProvider {
    static var previews: some View {
        Page401Page()
            .virtualScreenPreview()
    }
}
