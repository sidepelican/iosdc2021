import SwiftUI

public struct DeviceFrame<Content: View>: View {
    var content: Content
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VirtualScreen(resolution: UIImage(named: "deviceframe", in: .module, compatibleWith: nil)!.size) {
            ZStack {
                Image("deviceframe", bundle: .module)
                content
                    .padding(EdgeInsets(top: 100, leading: 34, bottom: 100, trailing: 35))
            }
        }
    }
}

struct DeviceFrame_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            DeviceFrame {
                Color.red
            }
        }
    }
}
