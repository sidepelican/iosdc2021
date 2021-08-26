import PresentationKit
import SwiftUI

struct TopTitle<Content: View>: View {
    var title: String
    var content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
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
                    .padding(.top, 44)
                    .padding(.bottom, 20)
                content
            }
                .padding(.horizontal, 52)
                .padding(.bottom, 16)
        }
        .font(.default(size: 42))
        .foregroundColor(.ex.black)
    }
}

struct TopTitle_Previews: PreviewProvider {
    static var previews: some View {
        VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
            TopTitle(title: "タイトル") {
                Itemize {
                    "箇条書き１"
                    "箇条書き２。長い文章長い文章長い文章長い文章長い文章長い文章"
                    "箇条書き３。インデントはないよ"
                }
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
