import PresentationKit
import SwiftUI

struct TitleAndSubtitle: View {
    var title: String
    var subtitle: String?

    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            VStack(spacing: 0) {
                Text(title)
                    .font(Font.default(size: 78).weight(.heavy))
                    .foregroundColor(.ex.black)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(Font.default(size: 48))
                        .foregroundColor(Color(white: 0x44 / 0xFF))
                }
            }
            .padding(32)
        }
    }
}

struct TitleAndSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleAndSubtitle(
                title: "あれ、またオレ何かやっちゃいましたか？",
                subtitle: "ソースソースソースソースソース"
            )
            .virtualScreenPreview()

            TitleAndSubtitle(
                title: "あれ、またオレ何かやっちゃいましたか？"
            )
            .virtualScreenPreview()
        }
        .previewLayout(.fixed(width: 1280, height: 720))
    }
}
