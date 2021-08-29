import PresentationKit
import SwiftUI

struct Page001Page: Page {
    var body: some View {
        TitleAndSubtitle(
            title: "元ゲーム開発者が贈る描画パフォーマンス改善",
            subtitle: "Iceman 🚁 @iceman5499"
        )
    }

    func cunningText(step: Int) -> String {
        """
        こんにちは、元ゲーム開発者が贈る描画パフォーマンス改善ということで発表させて頂きます。
        アイスマンといいます。宜しくおねがいします。
        """
    }
}

struct Page001Page_Previews: PreviewProvider {
    static var previews: some View {
        Page001Page()
            .virtualScreenPreview()
    }
}
