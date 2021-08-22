import UIKit

public final class EmojiListCViewController: BaseViewController<EmojiListCViewController.Cell> {
    public final class Cell: UICollectionViewCell, EmojiListCell {
        private let label = UILabel()
        private let title = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)

            contentView.layer.shadowColor = UIColor(red: 0xD8 / 0xFF, green: 0x1B / 0xFF, blue: 0x60 / 0xFF, alpha: 1).cgColor
            contentView.layer.shadowRadius = 3.4
            contentView.layer.shadowOpacity = 150 / 255
            contentView.layer.shadowOffset = .init(width: 0, height: 0)

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
            label.backgroundColor = background.backgroundColor
            label.clipsToBounds = true
            title.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14, weight: .bold))
            title.textColor = .black
            title.backgroundColor = background.backgroundColor
            title.clipsToBounds = true
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public override func layoutSubviews() {
            super.layoutSubviews()

            contentView.layer.shadowPath = CGPath(roundedRect: contentView.bounds, cornerWidth: 8, cornerHeight: 8, transform: nil)
        }

        public func configure(emoji: Emoji) {
            let shadow = NSShadow()
            shadow.shadowColor = UIColor(red: 0x4C / 0xFF, green: 0xAD / 0xFF, blue: 0x50 / 0xFF, alpha: 170 / 255)
            shadow.shadowOffset = .init(width: 0, height: 0)
            shadow.shadowBlurRadius = 4.6

            label.attributedText = NSAttributedString(string: emoji.value, attributes: [
                .shadow: shadow,
            ])
            title.text = emoji.title
        }
    }
}
