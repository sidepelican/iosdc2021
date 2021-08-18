import SwiftUI
import PresentationKit

//struct ContentView: View {
//    var body: some View {
//        VirtualScreen(resolution: CGSize(width: 1280, height: 720)) {
//            Presentation(pages: [
//                HelloPage(),
//                HelloWorldPage(),
//            ])
//            .resumeFromLastPage()
//        }
//    }
//}

struct HelloPage: View, Page {
    var body: some View {
        Text("Hello")
    }

    var cunningText: String {
        "Hello"
    }
}

struct HelloWorldPage: View, Page {
    @EnvironmentObject var context: PresentationContext
    var stepCount: Int { 2 }

    var body: some View {
        ZStack {
            context.currentStep == 1 ? Color.gray : Color.primary
            DeviceFrame {
                Text(context.currentStep == 0 ? "Hello": "World")
                    .foregroundColor(.black)
            }
            .padding()
        }
    }

    var cunningText: String {
        """
        Hello World
        -----------
        こんにちは世界
        """
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
