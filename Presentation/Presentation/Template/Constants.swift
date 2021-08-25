import SwiftUI

private let fontName = "Avenir Next"

extension Font {
    static func `default`(size: CGFloat) -> Font {
        .custom(fontName, size: size)
    }
}

extension Color {
    struct Ex {
        let black = Color(white: 0x22 / 0xFF)
    }

    static let ex = Ex()
}
