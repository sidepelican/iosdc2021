import PresentationKit
import SwiftUI

struct Page201Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "描画の流れを観察する")
    }

    func cunningText(step: Int) -> String {
        """
        はい、
        まずはですね、描画の改善に入る前に、みなさんと一緒にUI描画の流れを確認していきたいと思います。
        """
    }
}

struct Page201Page_Previews: PreviewProvider {
    static var previews: some View {
        Page201Page()
            .virtualScreenPreview()
    }
}
