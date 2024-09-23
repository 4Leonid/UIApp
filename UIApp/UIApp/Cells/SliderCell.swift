import UIKit

protocol SliderCellDelegate: AnyObject {
  func showText(_ text: String)
}

final class SliderCell: UITableViewCell {
  
  // MARK: - UIElements
  private let slider = UISlider()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: SliderCell.self)
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

extension SliderCell {
  @objc func sliderValueChanged() {
    delegate?.showSliderNumber("\(slider.value)")
  }
}

//  MARK: - Set Views and Constraints
private extension SliderCell {
  func setupUI() {
    // Title Label
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.minimumValue = 0
    slider.maximumValue = 100
    slider.value = 50
    slider.minimumTrackTintColor = .blue
    slider.maximumTrackTintColor = .red
    
    slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
  }
  
  func configureSubviews() {
    contentView.addSubview(slider)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      slider.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: slider.trailingAnchor, multiplier: 2),
      slider.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
