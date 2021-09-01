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

    func cunningText(step: Int) -> String {
        """
        なんと見てください。すごいですね。このHitchesのところめちゃくちゃ綺麗になりました。これは良いんじゃないでしょうか。

        やったか！？

        と言いたいところなんですが、なんとですね、このSurface Queue Timeってところ見てみると、Surfaceが3枚あるんですよね。
        3枚あるってどういうことかというと、
        2枚だと、1個の画面が出てる間に、次の画面を裏で用意しているっていう形になるんですよね。でそれらが交互に表示されるっていう形になります。
        3枚あるってことは、2枚じゃ間に合ってないんですよね。1枚表示してる間に裏で2枚並列して画面作ってるわけなんですよ。
        これがどういうことかっていうと、1枚表示するのに2フレーム分の時間かかってるっていうことなんですよね。
        だから結果としては画面操作に対するレスポンスが1フレーム分、つまり16ms遅れてるっていうことになるんですよね。

        ゲーミングディスプレイとか、僕はあんまり詳しくないですけど、2msとか5msのレベルで遅延がどうこう言ってるじゃないですか。そんな中でこのアプリは16msも遅延してるんですよね。やばくないですか。怒られちゃいそうですよね。

        これは良くないので、
        さらなる改善が必要になります。
        """
    }
}

struct Page406Page_Previews: PreviewProvider {
    static var previews: some View {
        Page406Page()
            .virtualScreenPreview()
    }
}
