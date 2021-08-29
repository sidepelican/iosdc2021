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
        描画の流れを確認したあと、さらに描画に関するいくつかの知識を確認して、
        後半にコードの改善に取り組んでいきたいと思います。
        """
    }
}

struct Page201Page_Previews: PreviewProvider {
    static var previews: some View {
        Page201Page()
            .virtualScreenPreview()
    }
}
