import PresentationKit
import SwiftUI

struct Page002Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        ZStack {
            TopTitle(title: "自己紹介") {
                HSplit(ratio: 0.7) {
                    Text("Iceman")
                        .fontWeight(.semibold)
                    Itemize {
                        "Twitter: @iceman5499"
                        "GitHub: @sidepelican"
                        "Qoncept, Inc"
                        "昔はスマホ向けのゲーム開発"
                        "自家用操縦士"
                    }
                } right: {
                    Image("twitter")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 24)
                        .padding(.top, 80)
                }

            }
            if context.currentStep >= 1 {
                Image("not_flight_simulator")
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        まず最初に自己紹介をします。
        Icemanといいます。TwitterとGitHubはこのIDでやっていってます。
        Qonceptという会社で働いています。
        昔はスマホ向けのゲームアプリ開発の仕事をしていました。
        特技はヘリコプターです。自家用操縦士の資格を持ってるので、ヘリコプターが操縦できます。
        このアイコンの赤いヘリコプターは僕一人が乗ってます。

        この写真はMicrosoft Flight Simulatorっていうゲームのスクショ・・・・ではなく、
        実機とんだ東京の空になります。
        空を飛ぶのはめちゃくちゃ楽しいので、みなさんもシミュレーターではなく実機を使ってみてはいかがでしょうか。
        """
    }
}

struct Page002Page_Previews: PreviewProvider {
    static var previews: some View {
        Page002Page()
            .virtualScreenPreview()
    }
}
