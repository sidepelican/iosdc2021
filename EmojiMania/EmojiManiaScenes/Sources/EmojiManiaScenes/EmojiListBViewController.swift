import UIKit

public final class EmojiListBViewController: BaseViewController<EmojiListBViewController.Cell> {
    public final class Cell: UICollectionViewCell, EmojiListCell {
        private let label = UILabel()
        private let title = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)

            // 影を単独のViewに分けてオフスクリーンレンダリングを減らす
            let shadow = UIView()
            shadow.layer.shadowColor = UIColor(red: 0x68 / 0xFF, green: 0x9F / 0xFF, blue: 0x38 / 0xFF, alpha: 1).cgColor
            shadow.layer.shadowRadius = 3.4
            shadow.layer.shadowOpacity = 150 / 255
            shadow.layer.shadowOffset = .init(width: 0, height: 0)

            shadow.backgroundColor = .white
            shadow.layer.cornerRadius = 8
            shadow.layer.rasterizationScale = UIScreen.main.scale
            shadow.layer.shouldRasterize = true // 描画結果をテクスチャに焼き込んでキャッシュする
            shadow.clipsToBounds = false
            contentView.addSubview(shadow)
            shadow.translatesAutoresizingMaskIntoConstraints = false
            shadow.pinEdgesToSuperView()

            let background = UIView()
            background.backgroundColor = .white
            background.layer.cornerRadius = 8

            contentView.addSubview(background)
            background.translatesAutoresizingMaskIntoConstraints = false
            background.pinEdgesToSuperView()

            let stack = UIStackView(arrangedSubviews: [label, title])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 6
            contentView.addSubview(stack)
            stack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])

            label.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 36))

            label.layer.shadowColor = UIColor(red: 0x4C / 0xFF, green: 0xAD / 0xFF, blue: 0x50 / 0xFF, alpha: 1).cgColor
            label.layer.shadowRadius = 2.3
            label.layer.shadowOpacity = 170 / 255
            label.layer.shadowOffset = .init(width: 0, height: 0)

            title.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14, weight: .bold))
            title.textColor = .black
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public func configure(emoji: Emoji) {
            label.text = emoji.value
            title.text = emoji.title
        }
    }
}
