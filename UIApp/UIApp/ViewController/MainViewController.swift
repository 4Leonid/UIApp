//
//  MainViewController.swift
//  UIApp
//
//  Created by Леонид Турко on 23.09.2024.
//

import UIKit

protocol MainViewControllerProtocol: UITableViewDataSource, UITableViewDelegate {}

final class MainViewController: UIViewController {
  
  private lazy var mainView = MainView(delegate: self)
  private let tableFactory = TableCellFactory()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
}

// MARK: - MainViewControllerProtocol
extension MainViewController: MainViewControllerProtocol {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableFactory.elementsofUI.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    tableFactory.makeCell(tableView: tableView, indexPath: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

// MARK: - CellDelegate
extension MainViewController: CellDelegate {
  func showStepper(_ value: String) {
    print(value)
  }
  
  func textFieldDidChange(with text: String) {
    print(text)
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



//  MARK: - Set Views and Constraints
extension MainViewController {
  func setupUI() {
    mainView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(mainView)
  }
  
  func setupConstraints() {
    mainView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
  
  func setDelegates() {
    mainView.delegate = self
    tableFactory.delegate = self
  }
}
