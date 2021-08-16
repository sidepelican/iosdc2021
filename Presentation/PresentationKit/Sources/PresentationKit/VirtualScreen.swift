import SwiftUI

public struct VirtualScreen<Content: View>: View {
    var resolution: CGSize
    var content: Content
    public init(resolution: CGSize, @ViewBuilder content: () -> Content) {
        self.resolution = resolution
        self.content = content()
    }

    public var body: some View {
        GeometryReader { context in
            self.content
                .frame(width: self.resolution.width, height: self.resolution.height)
                .scaleEffect(min(context.size.width / self.resolution.width, context.size.height / self.resolution.height))
                .frame(width: context.size.width, height: context.size.height)
        }
    }
}
