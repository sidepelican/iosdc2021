import SwiftUI
import PresentationKit

@main
struct PresentationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(after: .printItem) {
                Button("PDFで保存（遅いよ）") {
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
                    ]).saveToFile(resolution: .init(width: 1280, height: 720))
                }
                .keyboardShortcut("s", modifiers: .shift)
            }
        }
    }
}
