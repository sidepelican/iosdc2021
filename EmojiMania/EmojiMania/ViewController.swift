import EmojiManiaScenes
import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    private let pages: [UIViewController] = [
        EmojiListAViewController(),
        EmojiListBViewController(),
        EmojiListCViewController(),
    ]

    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([pages[0]], direction: .forward, animated: false)
        dataSource = self
    }

    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { fatalError() }

        let nextIndex = pages.index(before: index)
        guard pages.indices.contains(nextIndex) else { return nil }
        return pages[nextIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { fatalError() }

        let nextIndex = pages.index(after: index)
        guard pages.indices.contains(nextIndex) else { return nil }
        return pages[nextIndex]
    }
}
