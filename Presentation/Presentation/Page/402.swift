import PresentationKit
import SwiftUI

struct Page402Page: Page {
    var body: some View {
        TopTitle(title: "改善の前に、計測！") {
            Text("Xcode 12で追加されたAnimation Hitchesを使う")
            Image("animationHitches")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

struct Page402Page_Previews: PreviewProvider {
    static var previews: some View {
        Page402Page()
            .virtualScreenPreview()
    }
}
