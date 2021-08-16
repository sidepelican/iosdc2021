import SwiftUI

public struct HSplit<C1: View, C2: View>: View {
    var c1: C1
    var c2: C2
    var ratio: CGFloat

    public init(ratio: CGFloat = 0.5, @ViewBuilder left: () -> C1, @ViewBuilder right: () -> C2) {
        self.c1 = left()
        self.c2 = right()
        self.ratio = ratio
    }

    public var body: some View {
        GeometryReader { context in
            HStack {
                self.c1
                    .frame(width: context.size.width * ratio, height: context.size.height)
                self.c2
                    .frame(width: context.size.width * (1.0 - ratio), height: context.size.height)
            }
        }
    }
}
