import PresentationKit
import SwiftUI

struct Page505Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("サンプルアプリ改善Bの計測結果")
                        .lineLimit(1)
                        .font(.default(size: 64).weight(.heavy))
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal, 52)
                    Image("metrics_c")
                        .resizable()
                        .scaledToFill()
                }
                if context.currentStep >= 1 {
                    HStack {
                        Spacer()
                            .frame(width: 420)
                        VStack(alignment: .leading) {
                            Text("描画時間が全て16ms以下🎉")
                                .font(.default(size: 64)).fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                }

            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        計測した結果がこちらになります

        おわかりでしょうか。先程は3枚あったSurfaceが2枚しかありません！
        すべてのフレームにおいて、入力から次のフレームまでに描画が完了していることがわかります
        """
    }
}

struct Page505Page_Previews: PreviewProvider {
    static var previews: some View {
        Page505Page()
            .virtualScreenPreview()
    }
}
