import PresentationKit
import SwiftUI

struct TopTitle<Content: View>: View {
    var title: String
    var items: [String]
    var content: Content

    init(title: String, items: [String] = [], @ViewBuilder content: () -> Content) {
        self.title = title
        self.items = items
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            VStack(alignment: .leading) {
                Text(title)
                    .lineLimit(1)
                    .font(.default(size: 64).weight(.heavy))
                    .minimumScaleFactor(0.7)
                    .padding(.top, 52)
                    .padding(.bottom, 20)
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "circle.fill")
                            .scaleEffect(0.6)
                            .foregroundColor(Color(white: 0x33 / 0xFF))
                        Text("\(item)")
                    }
                }
                content
            }
                .padding(.horizontal, 52)
                .padding(.bottom, 8)
        }
        .font(.default(size: 42))
        .foregroundColor(.ex.black)
    }
}

struct TopTitle_Previews: PreviewProvider {
    static var previews: some View {
        VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
            TopTitle(title: "タイトル", items: [
                "箇条書き１",
                "箇条書き２。長い文章長い文章長い文章長い文章長い文章長い文章",
                "箇条書き３。インデントはないよ",
            ]) {
                Spacer()
                HStack {
                    Text("nanika")
                    Spacer()
                    Text("nanika")
                }
            }
        }
        .previewLayout(.fixed(width: 1280, height: 720))
    }
}
