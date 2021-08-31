import PresentationKit
import SwiftUI

private let shadowColor = Color(.sRGBLinear, white: 0.4, opacity: 1.0)

struct Page303Page: Page {
    var body: some View {
        TopTitle(title: "影の描画の流れ（想像）") {
            Itemize {
                "動的な影は上位レイヤの描画結果をもとにブラーをかける"
            }
            Text("　→ 作業用のオフスクリーンレンダリング領域が必要")
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer().frame(width: 260)
                    VStack(spacing: 0) {
                        Image("irasutoya")
                            .resizable()
                            .frame(width: 180, height: 180)
                        Image(systemName: "chevron.down")
                            .padding(4)
                    }
                    Spacer().frame(width: 30)
                    VStack(spacing: 0) {
                        Text("ここでブラーを画面全体にかけたくない")
                            .font(.default(size: 32))
                        Text("↓")
                    }
                    .frame(width: 220)
                    Spacer().frame(width: 30)
                    VStack(spacing: 0) {
                        Image("irasutoya")
                            .resizable()
                            .frame(width: 180, height: 180)
                        Image(systemName: "chevron.down")
                            .padding(4)
                    }
                }
                HStack(alignment: .top) {
                    Text("1")
                    Color.clear
                        .frame(width: 180, height: 180)
                        .border(Color.gray, width: 1)
                    Text("2").padding(.leading, 8)
                    Image("irasutoya").renderingMode(.template)
                        .resizable()
                        .foregroundColor(shadowColor)
                        .frame(width: 180, height: 180)
                        .border(Color.gray, width: 1)
                    Text("3").padding(.leading, 8)
                    Image("irasutoya").renderingMode(.template)
                        .resizable()
                        .foregroundColor(shadowColor)
                        .blur(radius: 10)
                        .frame(width: 180, height: 180)
                        .border(Color.gray, width: 1)
                    Text("4").padding(.leading, 8)
                    ZStack {
                        Image("irasutoya").renderingMode(.template)
                            .resizable()
                            .foregroundColor(shadowColor)
                            .blur(radius: 10)
                        Image("irasutoya")
                            .resizable()
                    }
                    .frame(width: 180, height: 180)
                    .border(Color.gray, width: 1)
                }
            }
            .padding(.leading, 120)
        }
    }

    func cunningText(step: Int) -> String {
        """
        影を描画するとどうしてオフスクリーンレンダリングになるのか、予想してみます。
        これはあくまで僕の想像で、実際のUIKitがどう動いてるのかはわかりません。

        Viewの見た目にあわせた影を今回は動的な影と呼びます。
        この動的な影は、上位レイヤの描画結果をもとにブラーをかける必要があるというのは、なんとなく想像がつくと思います。
        このブラー処理において、ブラーをメインの画面にかけてしまうと、画面全体がぼやけてしまうので、それは避けたいですよね。
        だからあらかじめこのリンゴしかいない専用の領域の中だけでブラーをかけることで、影だけをぼかす、っていうのを実現しているのだと思います。
        """
    }
}

struct Page303Page_Previews: PreviewProvider {
    static var previews: some View {
        Page303Page()
            .virtualScreenPreview()
    }
}
