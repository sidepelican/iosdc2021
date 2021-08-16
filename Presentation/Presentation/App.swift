import SwiftUI

@main
struct PresentationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(after: .printItem) {
                Button("PDFで保存（遅いよ）") {
                    print("work!")
                }
                .keyboardShortcut("s", modifiers: .shift)
            }
        }
    }
}
