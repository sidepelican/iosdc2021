import SwiftUI
import PresentationKit

struct ContentView: View {
    var body: some View {
        VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
            Presentation(scenes: [
                AnyView(
                    ZStack {
                        Color.white
                        DeviceFrame {
                            Text("Hello")
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                ),
                AnyView(
                    Text("Page 2")
                ),
            ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
