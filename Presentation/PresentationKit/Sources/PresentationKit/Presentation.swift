import SwiftUI

public struct Presentation: View {
    var context: PresentationContext
    var useResumeFromLastPage: Bool = false

    public init(pages: [AnyPage]) {
        self.context = PresentationContext(pages: pages)
    }

    public init(context: PresentationContext) {
        self.context = context
    }

    public var body: some View {
        if useResumeFromLastPage {
            ResumeFromLastPage {
                _Presentation()
            }
            .environmentObject(context)
        } else {
            _Presentation()
                .environmentObject(context)
        }
    }

    public func resumeFromLastPage() -> Presentation {
        var ret = self
        ret.useResumeFromLastPage = true
        return ret
    }
}

public final class PresentationContext: ObservableObject {
    enum Stepping {
        case forward
        case back
    }

    let pages: [AnyPage]
    @Published public var currentPageIndex = 0
    @Published public var currentStep = 0
    public var nextAnimation: Animation? = .easeInOut(duration: 0.2)
    var isEnd: Bool {
        currentPageIndex == pages.count - 1
            && pages[currentPageIndex].stepCount - 1 == currentStep
    }

    public init(pages: [AnyPage]) {
        self.pages = pages
    }

    func handleStep(_ stepping: Stepping) {
        let prevStep = currentStep
        withAnimation(nextAnimation) {
            switch stepping {
            case .forward:
                currentStep = min(pages[currentPageIndex].stepCount - 1, currentStep + 1)
            case .back:
                currentStep = max(0, currentStep - 1)
            }
        }
        if currentStep == prevStep {
            switch stepping {
            case .forward:
                let newPageIndex = min(pages.count - 1, currentPageIndex + 1)
                if newPageIndex != currentPageIndex {
                    currentPageIndex = newPageIndex
                    currentStep = 0
                }
            case .back:
                let newPageIndex = max(0, currentPageIndex - 1)
                if newPageIndex != currentPageIndex {
                    currentPageIndex = newPageIndex
                    currentStep = pages[currentPageIndex].stepCount - 1
                }
            }
        }
    }
}

struct _Presentation: View {
    @EnvironmentObject var context: PresentationContext

    @State var dragStart: Date?
    @State var pointerPosition: CGPoint?

    var showPointer: Bool {
        if pointerPosition != nil, let dragStart = dragStart {
            return Date().timeIntervalSince(dragStart) > 0.3
        }
        return false
    }

    var body: some View {
        ZStack {
            context.pages[context.currentPageIndex].anyView
            if showPointer {
                Image(systemName: "circle.fill")
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.red)
                    .blur(radius: 2)
                    .position(pointerPosition!)
            }
        }
        .overlay(KeyboardHandleView())
        .gesture(
            DragGesture(minimumDistance: 50)
                .onChanged { e in
                    self.pointerPosition = e.location
                    if self.dragStart == nil {
                        self.dragStart = Date()
                    }
                }
                .onEnded { e in
                    let showPointer = self.showPointer
                    self.pointerPosition = nil
                    self.dragStart = nil
                    if showPointer { return }

                    if e.startLocation.x < e.location.x {
                        self.context.handleStep(.back)
                    } else {
                        self.context.handleStep(.forward)
                    }
                }
        )
    }
}
