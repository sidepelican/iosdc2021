import PresentationKit
import SwiftUI

struct Page104Page: Page {
    var body: some View {
        TopTitle(title: "サンプルアプリケーションの動作") {
            HSplit {
                Video(named: "movie_a")
                Text("改善前")
                    .frame(maxWidth: .infinity, alignment: .center)
            } right: {

            }
        }
    }
}

struct Page104Page_Previews: PreviewProvider {
    static var previews: some View {
        Page104Page()
            .virtualScreenPreview()
    }
}
