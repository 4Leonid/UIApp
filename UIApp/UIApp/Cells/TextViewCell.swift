import UIKit

final class TextViewCell: UITableViewCell {
  
  // MARK: - UIElements
  private let textView = UITextView()
  
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
    textView.text = text
  }
}

//  MARK: - Set Views and Constraints
private extension TextViewCell {
  func setupUI() {
    // Title Label
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.backgroundColor = .yellow
    textView.text = "Hello there"
    textView.textAlignment = .center
  }
  
  func configureSubviews() {
    contentView.addSubview(textView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      textView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: textView.trailingAnchor, multiplier: 2),
      textView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      textView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      textView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
    ])
  }
}
