import UIKit

final class MainView: UIView {
  
  private let tableView = MainTableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//  MARK: - Set Views and Constraints
extension MainView {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.edgesToSuperview()
  }
}

