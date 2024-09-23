import UIKit

final class TextFieldCell: UITableViewCell {
  
  // MARK: - UIElements
  private let textField = UITextField()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: TextFieldCell.self)
  static let rowHeigh: CGFloat = 100
  
  weak var delegate: CellDelegate?
  
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

extension TextFieldCell: UITextFieldDelegate {
  @objc func textFieldDidChange() {
    delegate?.textFieldDidChange(with: textField.text ?? "")
  }
}

//  MARK: - Set Views and Constraints
private extension TextFieldCell {
  func setupUI() {
    // Title Label
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    textField.borderStyle = .roundedRect
  }
  
  func configureSubviews() {
    contentView.addSubview(    textField)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      textField.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 2),
      textField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
  
  func setDelegates() {
    textField.delegate = self
  }
}
