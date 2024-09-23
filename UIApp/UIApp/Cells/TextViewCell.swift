import UIKit

final class TextViewCell: UITableViewCell {
  
  // MARK: - UIElements
  private let customTextView = UITextView()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: TextViewCell.self)
  static let rowHeigh: CGFloat = 100
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .red
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TextViewCell {
  func configure(with text: String) {
    customTextView.text = text
  }
}

//  MARK: - Set Views and Constraints
private extension TextViewCell {
  func setupUI() {
    // Title Label
    customTextView.translatesAutoresizingMaskIntoConstraints = false
    customTextView.backgroundColor = .yellow
    customTextView.text = "Hello there"
    customTextView.textAlignment = .center
  }
  
  func configureSubviews() {
    contentView.addSubview(customTextView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      customTextView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: customTextView.trailingAnchor, multiplier: 2),
      customTextView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      customTextView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      customTextView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
    ])
  }
}
