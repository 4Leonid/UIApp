//
//  ViewController.swift
//  UIApp
//
//  Created by Леонид Турко on 23.09.2024.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var tableView = CustomView(delegate: self)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    7
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.reuseIdentifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
      let text = "\(indexPath.row)"
      cell.configure(with: text)
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
      cell.delegate = self
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderCell.reuseIdentifier, for: indexPath) as? SliderCell else { return UITableViewCell() }
      cell.delegate = self
      return cell
    case 3:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.reuseIdentifier, for: indexPath) as? SwitchCell else { return UITableViewCell() }
      cell.delegate = self
      return cell
    case 4:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.reuseIdentifier, for: indexPath) as? TextViewCell else { return UITableViewCell() }
      return cell
    case 5:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: StepperCell.reuseIdentifier, for: indexPath) as? StepperCell else { return UITableViewCell() }
      return cell
      
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as? ButtonCell else { return UITableViewCell() }
      cell.delegate = self
      return cell
    }
  }
}

// MARK: - CellDelegate
extension ViewController: CellDelegate {
  func textFieldDidChange(withText: String) {
    <#code#>
  }
  
  func showSwitchChanged(_ text: String) {
    print(text)
  }
  
  func showSliderNumber(_ text: String) {
    print(text)
  }
  
  func showButtonTapped() {
    print("Button tapped")
  }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

//  MARK: - Set Views and Constraints
extension ViewController {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
  
  func setDelegates() {
    tableView.delegate = self
  }
}
