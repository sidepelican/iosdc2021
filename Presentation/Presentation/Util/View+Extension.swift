import PresentationKit
import SwiftUI

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
