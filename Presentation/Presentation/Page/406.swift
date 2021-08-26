import PresentationKit
import SwiftUI

struct Page406Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("サンプルアプリ改善Aの計測結果")
                        .lineLimit(1)
                        .font(.default(size: 64).weight(.heavy))
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal, 52)
                    Image("metrics_b")
                        .resizable()
                        .scaledToFill()
                }

                if context.currentStep >= 1 {
                    HStack {
                        Spacer()
                            .frame(width: 480)
                        VStack(alignment: .leading) {
                            Text("やったか！？")
                                .font(.default(size: 64)).fontWeight(.bold)
                            if context.currentStep >= 2 {
                                Text(Image(systemName: "circlebadge.fill")) + Text(" Hitchesはなくなった")
                                Text(Image(systemName: "circlebadge.fill")) + Text(" Surfaceが3枚ある🤔")
                                Text("　→  16ms遅延している")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.default(size: 42))
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct Page406Page_Previews: PreviewProvider {
    static var previews: some View {
        Page406Page()
            .virtualScreenPreview()
    }
}
