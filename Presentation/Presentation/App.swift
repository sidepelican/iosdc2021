import SwiftUI
import PresentationKit

private let cunnningWindowIdentifier = "com.gmail.side.junktown.Presentation.CunnningPaper"

@main
struct PresentationApp: App {
    let presentationContext = PresentationContext(pages: [
        HelloPage(),
        HelloWorldPage(),
    ])

    var body: some Scene {
        WindowGroup {
            VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
                Presentation(context: presentationContext)
                    .resumeFromLastPage()
            }
        }
        .commands {
            CommandGroup(after: .printItem) {
                Button("PDFで保存（遅いよ）") {
                    Presentation(context: presentationContext)
                        .saveToFile(resolution: .init(width: 1280, height: 720))
                }
                .keyboardShortcut("s", modifiers: .command)
            }
            CommandGroup(after: .toolbar) {
                Button("カンペウィンドウを表示") {
                    if UIApplication.shared.openSessions.count >= 2 { // より正しい方法ですでに開いているか判定したい
                        return
                    }
                    let userActivity = NSUserActivity(activityType: cunnningWindowIdentifier)
                    userActivity.targetContentIdentifier = cunnningWindowIdentifier

                    let options = UIScene.ActivationRequestOptions()
                    #if os(macOS)
                    options.collectionJoinBehavior = .disallowed
                    #endif
                    UIApplication.shared.requestSceneSessionActivation(nil, userActivity: userActivity, options: options)
                }
                .keyboardShortcut("d", modifiers: .command)
            }
        }

        WindowGroup("CunnningPaper", id: cunnningWindowIdentifier) {
            CunnningPaper(context: presentationContext)
        }
        .handlesExternalEvents(matching: [cunnningWindowIdentifier])
    }
}
