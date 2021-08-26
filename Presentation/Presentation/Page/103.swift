import PresentationKit
import SwiftUI

struct Page103Page: Page {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("サンプルアプリのセルの実装")
                    .lineLimit(1)
                    .font(.default(size: 64).weight(.heavy))
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal, 52)
                Image("code_a")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct Page103Page_Previews: PreviewProvider {
    static var previews: some View {
        Page103Page()
            .virtualScreenPreview()
    }
}
