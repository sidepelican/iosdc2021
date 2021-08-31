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

    func cunningText(step: Int) -> String {
        """
        今回のアプリはこのような結果となりました。
        ひどいですね。
        （マウスぐるぐるしながら）このへんがカクつきが起こったことを表しています。
        下のBuilt in Displayってのが各フレームが画面にどれくらい表示されてたかを表しています。
        太いやつは、それだけ長い時間画面に存在しつづけてたことを意味していて、つまり処理落ちしているということになります。
        """
    }
}

struct Page403Page_Previews: PreviewProvider {
    static var previews: some View {
        Page403Page()
            .virtualScreenPreview()
    }
}
