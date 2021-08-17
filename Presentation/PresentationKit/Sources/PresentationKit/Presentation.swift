import SwiftUI

public struct Presentation: View {
    public var scenes: [AnyView]
    public init(scenes: [AnyView]) {
        self.scenes = scenes
    }

    public var body: some View {
        _Presentation(scenes: scenes)
            .environmentObject(PresentationController(sceneCount: scenes.count))
    }
}

class PresentationController: ObservableObject {
    enum Stepping {
        case forward
        case back
    }
    enum Action {
        case forward
        case stay
        case back
    }
    var currentTransitionHandler: ((Stepping) -> (Action))?

    func handleSwipe(_ stepping: Stepping) {
        if let customHandler = currentTransitionHandler {
            let action = customHandler(stepping)
            switch action {
            case .back:
                currentTransitionHandler = nil
                currentSceneIndex = max(0, currentSceneIndex - 1)
            case .forward:
                currentTransitionHandler = nil
                currentSceneIndex = min(sceneCount - 1, currentSceneIndex + 1)
            case .stay:
                break
            }
        } else {
            switch stepping {
            case .back:
                currentSceneIndex = max(0, currentSceneIndex - 1)
            case .forward:
                currentSceneIndex = min(sceneCount - 1, currentSceneIndex + 1)
            }
        }
    }

    let sceneCount: Int
    @Published var currentSceneIndex = 0 {
        didSet {
            UserDefaults.standard.set(currentSceneIndex, forKey: "currentSceneIndex")
        }
    }

    init(sceneCount: Int) {
        self.sceneCount = sceneCount
        currentSceneIndex = min(sceneCount - 1, UserDefaults.standard.integer(forKey: "currentSceneIndex"))
    }

    static func defaultStepper(
        _ step: Binding<Int>,
        maxStep: Int,
        animation: ((_ currentStep: Int) -> Animation?)? = { _ in .default }
    ) -> (Stepping) -> Action {
        { stepping in
            let prevStep = step.wrappedValue
            withAnimation(animation?(prevStep)) {
                switch stepping {
                case .forward:
                    step.wrappedValue = min(maxStep, step.wrappedValue + 1)
                case .back:
                    step.wrappedValue = max(0, step.wrappedValue - 1)
                }
            }
            if step.wrappedValue == prevStep {
                switch stepping {
                case .forward:
                    return .forward
                case .back:
                    return .back
                }
            } else {
                return .stay
            }
        }
    }
}

struct _Presentation: View {
    @EnvironmentObject var controller: PresentationController
    var scenes: [AnyView]

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
                self.controller.handleSwipe(.back)
            }, label: EmptyView.init)
            .hidden()
            .keyboardShortcut(.leftArrow, modifiers: [])

            Button(action: {
                self.controller.handleSwipe(.forward)
            }, label: EmptyView.init)
            .hidden()
            .keyboardShortcut(.rightArrow, modifiers: [])

            scenes[controller.currentSceneIndex]
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
                        self.controller.handleSwipe(.back)
                    } else {
                        self.controller.handleSwipe(.forward)
                    }
                }
        )
    }
}
