import UIKit

final class StepperCell: UITableViewCell {
  
  // MARK: - UIElements
  private let stepper = UIStepper()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: StepperCell.self)
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

extension StepperCell {
  @objc func stepperChanged() {
    delegate?.showStepper("\(stepper.value)")
  }
}

//  MARK: - Set Views and Constraints
private extension StepperCell {
  func setupUI() {
    // Title Label
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.minimumValue = 0
    stepper.maximumValue = 10
    stepper.stepValue = 1
    stepper.value = 0
    stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
  }
  
  func configureSubviews() {
    contentView.addSubview(stepper)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stepper.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      stepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
