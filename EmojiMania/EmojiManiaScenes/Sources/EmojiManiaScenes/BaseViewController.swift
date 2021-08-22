import UIKit

public protocol EmojiListCell: UICollectionViewCell {
    func configure(emoji: Emoji)
}

public class BaseViewController<Cell: EmojiListCell>: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Emoji>
    private var dataSource: DataSource!

    public init() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1 / 3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 6, leading: 6, bottom: 6, trailing: 6)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(1 / 3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)

        let layout = UICollectionViewCompositionalLayout(section: section)

        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(Cell.self)"

        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .init(white: 0xEE / 0xFF, alpha: 1.0)

        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            cell.configure(emoji: item)
            return cell
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if dataSource.snapshot().numberOfItems == 0 {
            var snapshot = DataSource.Snapshot()
            snapshot.appendSections([1])
            snapshot.appendItems(Emoji.emojis, toSection: 1)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
}
