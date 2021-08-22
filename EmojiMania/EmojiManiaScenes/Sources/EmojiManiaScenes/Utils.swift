import UIKit

extension UICollectionViewDiffableDataSource {
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>
}

extension UIView {
    func pinEdgesToSuperView(inset: CGFloat = 0) {
        let superView = self.superview!
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: inset),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -inset),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -inset),
        ])
    }
}
