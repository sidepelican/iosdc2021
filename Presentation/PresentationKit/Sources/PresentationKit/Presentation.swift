import SwiftUI

public struct Presentation: View {
    public var pages: [AnyPage]
    public init(pages: [AnyPage]) {
        self.pages = pages
    }

    public var body: some View {
        _Presentation()
            .environmentObject(PresentationContext(pages: pages))
    }
}

public final class PresentationContext: ObservableObject {
    enum Stepping {
        case forward
        case back
    }

    let pages: [AnyPage]
    @Published public var currentPageIndex = 0 {
        didSet {
            UserDefaults.standard.set(currentPageIndex, forKey: "currentPageIndex")
        }
    }
    @Published public var currentStep = 0
    public var nextAnimation: Animation? = .default
    var isEnd: Bool {
        currentPageIndex == pages.count - 1
            && pages[currentPageIndex].stepCount - 1 == currentStep
    }

    init(pages: [AnyPage]) {
        self.pages = pages
        currentPageIndex = min(pages.count - 1, UserDefaults.standard.integer(forKey: "currentPageIndex"))
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
                currentPageIndex = min(pages.count - 1, currentPageIndex + 1)
                currentStep = 0
            case .back:
                currentPageIndex = max(0, currentPageIndex - 1)
                currentStep = pages[currentPageIndex].stepCount - 1
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
            Button(action: {
                self.context.handleStep(.back)
            }, label: EmptyView.init)
            .hidden()
            .keyboardShortcut(.leftArrow, modifiers: [])

            Button(action: {
                self.context.handleStep(.forward)
            }, label: EmptyView.init)
            .hidden()
            .keyboardShortcut(.rightArrow, modifiers: [])

            context.pages[context.currentPageIndex].anyBody
            if showPointer {
                Image(systemName: "circle.fill")
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.red)
                    .blur(radius: 2)
                    .position(pointerPosition!)
            }
        }
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
