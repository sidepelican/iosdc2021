import PresentationKit
import SwiftUI

struct TitlePage: Page {
    var body: some View {
        TitleAndSubtitle(
            title: "元ゲーム開発者が贈る描画パフォーマンス改善",
            subtitle: "Iceman 🚁 @iceman5499"
        )
    }
}

struct TitlePage_Previews: PreviewProvider {
    static var previews: some View {
        TitlePage()
            .virtualScreenPreview()
    }
}
