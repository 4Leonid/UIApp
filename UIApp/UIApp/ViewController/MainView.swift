import UIKit

final class MainView: UIView {
  
  private let tableView =  UITableView()
  
  weak var delegate: MainViewControllerProtocol?
  
  init(delegate: MainViewControllerProtocol?) {
    self.delegate = delegate
    super.init(frame: .zero)
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//  MARK: - Set Views and Constraints
extension MainView {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(LabelCell.self, forCellReuseIdentifier: LabelCell.reuseIdentifier)
    tableView.register(ButtonCell.self, forCellReuseIdentifier: ButtonCell.reuseIdentifier)
    tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
    tableView.register(SliderCell.self, forCellReuseIdentifier: SliderCell.reuseIdentifier)
    tableView.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.reuseIdentifier)
    tableView.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.reuseIdentifier)
    tableView.register(StepperCell.self, forCellReuseIdentifier: StepperCell.reuseIdentifier)
    tableView.rowHeight = LabelCell.rowHeigh
  }
  
  func configureSubviews() {
    addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
  
  func setDelegates() {
    tableView.dataSource = delegate
    tableView.delegate = delegate
  }
}

