import UIKit
import SwiftUI

struct UIViewControllerWrapper: UIViewControllerRepresentable {
    var viewController: UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    func updateUIViewController(_ vc: UIViewController, context: Context) {
    }
}

extension UIViewController {
    func preview() -> UIViewControllerWrapper {
        UIViewControllerWrapper(viewController: self)
    }

    func wrapped() -> UIViewControllerWrapper {
        UIViewControllerWrapper(viewController: self)
    }
}
