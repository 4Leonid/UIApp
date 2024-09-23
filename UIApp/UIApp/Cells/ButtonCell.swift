import UIKit

protocol ButtonCellDelegate: AnyObject {
  func showText()
}

final class ButtonCell: UITableViewCell {
  
  // MARK: - UIElements
  private let button = UIButton(type: .system)
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: ButtonCell.self)
  static let rowHeigh: CGFloat = 100
  
  weak var delegate: ButtonCellDelegate?
  
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

extension ButtonCell {
  @objc func buttonTapped() {
    delegate?.showText()
  }
}

//  MARK: - Set Views and Constraints
private extension ButtonCell {
  func setupUI() {
    // Title Label
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Push me", for: .normal)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.backgroundColor = .red
    button.tintColor = .white
    button.layer.cornerRadius = 10
  }
  
  func configureSubviews() {
    contentView.addSubview(    button)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
      button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
      button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
