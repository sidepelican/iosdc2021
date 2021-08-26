import PresentationKit
import SwiftUI

struct Page403Page: Page {
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 0) {
                Text("サンプルアプリ初期実装の計測結果")
                    .lineLimit(1)
                    .font(.default(size: 64).weight(.heavy))
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal, 52)
                Image("metrics_a")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct Page403Page_Previews: PreviewProvider {
    static var previews: some View {
        Page403Page()
            .virtualScreenPreview()
    }
}
