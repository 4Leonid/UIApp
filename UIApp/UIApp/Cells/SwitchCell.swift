import UIKit

final class SwitchCell: UITableViewCell {
  
  var onSwitchValueChanged: ((String) -> Void)?
  
  // MARK: - UIElements
  private let customSwitch = UISwitch()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: SwitchCell.self)
  static let rowHeigh: CGFloat = 100
  
  weak var delegate: CellDelegate?
  
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

// MARK: - Actions
extension SwitchCell {
  @objc func showSwitchChanged() {
    onSwitchValueChanged?(
      customSwitch.isOn
      ? "Switch is On"
      : "Switch is Off"
    )
  }
}

//  MARK: - Set Views and Constraints
private extension SwitchCell {
  func setupUI() {
    // Title Label
    customSwitch.translatesAutoresizingMaskIntoConstraints = false
    customSwitch.isOn = true
    customSwitch.addTarget(self, action: #selector(showSwitchChanged), for: .valueChanged)
  }
  
  func configureSubviews() {
    contentView.addSubview(customSwitch)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      customSwitch.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      customSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
