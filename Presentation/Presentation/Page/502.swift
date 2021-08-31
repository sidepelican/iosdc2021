import PresentationKit
import SwiftUI

struct RotationEffect: GeometryEffect {
    var angle: CGFloat

    var animatableData: CGFloat {
        get { angle }
        set { angle = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(rotationAngle: angle))
    }
}

struct ScaleYEffect: GeometryEffect {
    var scaleY: CGFloat

    var animatableData: CGFloat {
        get { scaleY }
        set { scaleY = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(scaleX: 1.0, y: scaleY))
    }
}

extension View {
    fileprivate func myEffect(_ enable: Bool) -> some View {
        self
            .modifier(RotationEffect(angle: enable ? .pi * -0.21 : 0))
            .modifier(ScaleYEffect(scaleY: enable ? 0.4 : 1.0))
    }
}

struct Page502Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 3 }

    var expanded: Bool {
        context.currentStep >= 1
    }

    private var cellA: some View {
        ZStack {
            Text("😀")
                .font(Font.system(size: 72))
                .foregroundColor(Color.white)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray, lineWidth: expanded ? 2 : 0)
                )
                .myEffect(expanded)
                .padding(.top, expanded ? -200 : -100)
                .zIndex(10)
            Image(systemName: "circle.fill")
                .foregroundColor(Color(.sRGBLinear, white: 0.5, opacity: 1.0))
                .position(x: 108, y: 108)
                .font(Font.system(size: 72))
                .blur(radius: 4)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray, lineWidth: expanded ? 2 : 0)
                )
                .overlay(Text(expanded ? "Dynamic" : ""))
                .myEffect(expanded)
                .padding(.top, expanded ? 50 : -100)
                .zIndex(9)
            Color(.sRGBLinear, white: 0.75, opacity: 1)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .myEffect(expanded)
                .padding(.top, expanded ? 300 : -100)
                .zIndex(8)
            Color.white
                .foregroundColor(Color.black)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.43), radius: 10)
                .overlay(Text("Dynamic"))
                .myEffect(expanded)
                .padding(.top, expanded ? 550 : -100)
                .zIndex(7)
        }
        .font(Font.system(size: 42))
    }

    private var cellB: some View {
        ZStack {
            Text("😀")
                .font(Font.system(size: 72))
                .shadow(radius: 2, x: 10, y: 10)
                .foregroundColor(Color.white)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray, lineWidth: expanded ? 2 : 0)
            )
                .myEffect(expanded)
                .padding(.top, expanded ? -200 : -100)
                .zIndex(10)
            Color(.sRGBLinear, white: 0.75, opacity: 1)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .myEffect(expanded)
                .padding(.top, expanded ? 300 : -100)
                .zIndex(8)
            Color.white
                .foregroundColor(Color.black)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.43), radius: 10)
                .overlay(Text("Shadow Path").multilineTextAlignment(.center))
                .myEffect(expanded)
                .padding(.top, expanded ? 550 : -100)
                .zIndex(7)
        }
        .font(Font.system(size: 42))
    }

    var descMessage: String {
        switch context.currentStep {
        case 0:
            return "セルのレイヤ構造を強く意識して改善する"
        case 1:
            return "動的な影が複数存在しOSRが何度も必要になってる"
        case 2:
            return "工夫して動的な影の生成を減らす"
        default:
            return ""
        }
    }

    var body: some View {
        TopTitle(title: "改善してみるB") {
            Itemize {
                descMessage
            }
            HSplit(ratio: 0.6) {
                HSplit {
                    cellA
                } right: {
                    if context.currentStep >= 2 {
                        HStack(spacing: 0) {
                            Text("→")
                            cellB
                        }
                    }
                }
                .padding(.top, expanded ? -120 : 200)
                .padding(.leading, expanded ? 0 : 45)
            } right: {
                if context.currentStep >= 2 {
                    Itemize {
                        "ラベルの影には NSShadow を利用"
                        "shadowPathを使い影の形を手で与える"
                    }
                }
            }
        }
    }

    func cunningText(step: Int) -> String {
        """
        ここからはセルの構造をきちんと考えて改善していきます。
        今回のセルは大雑把に展開するとこういう感じになります。

        一番上に絵文字のラベルがあって、その下に絵文字の影レイヤがあります。
        その下にまた背景Viewがあって、その下敷きViewにもまた影があるという形になります。
        絵文字の部分と角丸の部分とでそれぞれ動的な影を生成していて、描画が重い原因になっています。

        この動的な影を減らすのにも、いくかのテクニックがあります。
        まずラベルの影なんですが、これはNSAttibutedStringを使ってNSShadowで影をつける形にすると、影をフォントから生成できるので速くなります。
        実はFlutterでみたときも絵文字の影はフォントとして描画されていたのを覚えているでしょうか。
        実装はやや面倒なんですけど、文字の影はNSAttibutedStringを使ったほうが確実に速いです。

        下敷きの影については、実はCALayerにはshadowPathというプロパティがあり、影の形をCGPath使って指定することができます。
        これを使って、Viewと同じ形になるようPathを与えることで、オフスクリーンレンダリングを使わなくても影を描画できるようになります。        
        """
    }
}

struct Page502Page_Previews: PreviewProvider {
    static var previews: some View {
        Page502Page()
            .virtualScreenPreview()
    }
}
