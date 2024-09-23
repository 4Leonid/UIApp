import UIKit

import UIKit

final class LabelCell: UITableViewCell {
  
  // MARK: - UIElements
  private let titleLabel = UILabel()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: LabelCell.self)
  static let rowHeigh: CGFloat = 100
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LabelCell {
  func configure(with text: String) {
    titleLabel.text = text
  }
}

//  MARK: - Set Views and Constraints
private extension LabelCell {
  func setupUI() {
    // Title Label
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.numberOfLines = 1
    titleLabel.font = .preferredFont(forTextStyle: .title2)
  }
  
  func configureSubviews() {
    contentView.addSubview(titleLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
