import SwiftUI
import PresentationKit

private let cunnningWindowIdentifier = "com.gmail.side.junktown.Presentation.CunnningPaper"

@main
struct PresentationApp: App {
    let presentationContext = PresentationContext(pages: [
        Page001Page(),
        Page002Page(),
        Page101Page(),
        Page102Page(),
        Page103Page(),
        Page104Page(),
        Page201Page(),
        Page202Page(),
        Page203Page(),
        Page203_5Page(),
        Page204Page(),
        Page205Page(),
        Page206Page(),
        Page301Page(),
        Page302Page(),
        Page303Page(),
        Page401Page(),
        Page402Page(),
        Page403Page(),
        Page404Page(),
        Page405Page(),
        Page406Page(),
        Page501Page(),
        Page502Page(),
        Page503Page(),
        Page504Page(),
        Page505Page(),
        Page506Page(),
        Page507Page(),
        Page601Page(),
    ])

    var body: some Scene {
        WindowGroup {
            VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
                Presentation(context: presentationContext)
                    .resumeFromLastPage()
                    .background(Color.white)
            }
            .background(Color.black)
            .preferredColorScheme(.light)
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
