import SwiftUI
import UIKit

extension Presentation {
    public func saveToFile(resolution: CGSize) {
        let filename = "export.pdf"

        guard let exportURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?.appendingPathComponent(filename) else { return }

        let presentationContext = PresentationContext(pages: context.pages)
        presentationContext.currentPageIndex = 0
        let vc = UIHostingController(rootView: VirtualScreen(resolution: resolution) {
            _Presentation()
                .environmentObject(presentationContext)
        })
        vc.view.bounds = CGRect(x: 0, y: 0, width: resolution.width, height: resolution.height)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: vc.view.bounds.size))
        try! pdfRenderer.writePDF(to: exportURL) { context in
            while true {
                context.beginPage()
                print("printing page \(presentationContext.currentPageIndex+1) step \(presentationContext.currentStep)...")
                vc.view.drawHierarchy(in: context.pdfContextBounds, afterScreenUpdates: true)

                if presentationContext.isEnd {
                    break
                }

                presentationContext.nextAnimation = nil
                presentationContext.handleStep(.forward)
            }
        }

        let controller = UIDocumentPickerViewController(forExporting: [exportURL])
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.present(controller, animated: true)
    }
}
