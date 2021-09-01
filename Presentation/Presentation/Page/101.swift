import PresentationKit
import SwiftUI

struct Page101Page: Page {
    var body: some View {
        TitleAndSubtitle(title: "描画パフォーマンスを改善する")
    }

    func cunningText(step: Int) -> String {
        """
        今回は描画パフォーマンスの改善ということで、
        普段意識されづらい部分に注目してアプリケーションの体験を改善していきます。
        まずは今回の話題の中心となるサンプルアプリケーションを紹介します。
        """
    }
}

struct Page101Page_Previews: PreviewProvider {
    static var previews: some View {
        Page101Page()
            .virtualScreenPreview()
    }
}
