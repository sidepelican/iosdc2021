import PresentationKit
import SwiftUI

struct Page507Page: Page {
    var body: some View {
        TopTitle(title: "これまでの改善の比較") {
            HSplit {
                Video(named: "movie_a")
                Text("改善前")
                    .frame(maxWidth: .infinity, alignment: .center)
            } right: {
                Video(named: "movie_c")
                Text("改善B")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct Page507Page_Previews: PreviewProvider {
    static var previews: some View {
        Page507Page()
            .virtualScreenPreview()
    }
}
