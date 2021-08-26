import PresentationKit
import SwiftUI

extension Page {
    func virtualScreenPreview() -> some View {
        Group {
            ForEach(0..<self.stepCount, id: \.self) { i in
                let context = PresentationContext(pages: [self])
                VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
                    Presentation(context: context)
                }
                .onAppear {
                    context.currentStep = i
                }
            }
        }
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 1280, height: 720))
    }
}

extension View {
    func virtualScreenPreview() -> some View {
        VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
            self
        }
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 1280, height: 720))
    }

    func gradientMasked(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        overlay(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
        )
        .mask(self)
    }
}
