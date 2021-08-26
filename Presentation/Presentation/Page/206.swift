import PresentationKit
import SwiftUI

private let images: [String] = [
    "flutterDebug1",
    "flutterDebug2",
    "flutterDebug3",
    "flutterDebug3_5",
    "flutterDebug4",
    "flutterDebug5",
    "flutterDebug6",
    "flutterDebug7",
    "flutterDebug8",
    "flutterDebug9",
    "flutterDebug10",
    "flutterDebug11",
    "flutterDebug4",
    "flutterDebug1",
]

struct Page206Page: Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { images.count }

    var body: some View {
        Image(images[context.currentStep])
            .resizable()
            .scaledToFit()
    }
}

struct Page206Page_Previews: PreviewProvider {
    static var previews: some View {
        Page206Page()
            .virtualScreenPreview()
    }
}
