//
//  MainTableView.swift
//  UIApp
//
//  Created by Леонид Турко on 27.09.2024.
//

import UIKit

enum TableRow: Int, CaseIterable {
  case label
  case textField
  case slider
  case switcher
  case textView
  case stepper
  case button
}

final class MainTableView: UITableView {
  
  var text: String?
  
  init() {
    super.init(frame: .zero, style: .grouped)
    
    self.register(LabelCell.self, forCellReuseIdentifier: LabelCell.reuseIdentifier)
    self.register(ButtonCell.self, forCellReuseIdentifier: ButtonCell.reuseIdentifier)
    self.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
    self.register(SliderCell.self, forCellReuseIdentifier: SliderCell.reuseIdentifier)
    self.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.reuseIdentifier)
    self.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.reuseIdentifier)
    self.register(StepperCell.self, forCellReuseIdentifier: StepperCell.reuseIdentifier)
    self.rowHeight = LabelCell.rowHeigh
    
    self.delegate = self
    self.dataSource = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainTableView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    TableRow.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let tableRow = TableRow(rawValue: indexPath.row)
    
    switch tableRow {
    case .label:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.reuseIdentifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
      let text = "\(indexPath.row + 1)"
      cell.configure(with: text)
      return cell
    case .textField:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
      cell.onTextFieldValueChanged = { print($0) }
      return cell
    case .slider:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderCell.reuseIdentifier, for: indexPath) as? SliderCell else { return UITableViewCell() }
      cell.onSliderValueChanged = { print($0) }
      return cell
    case .switcher:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.reuseIdentifier, for: indexPath) as? SwitchCell else { return UITableViewCell() }
      cell.onSwitchValueChanged = { print($0) }
      return cell
    case .textView:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.reuseIdentifier, for: indexPath) as? TextViewCell else { return UITableViewCell() }
      return cell
    case .stepper:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: StepperCell.reuseIdentifier, for: indexPath) as? StepperCell else { return UITableViewCell() }
      cell.onStepperValueChanged = { print($0) }
      return cell
    case .button:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as? ButtonCell else { return UITableViewCell() }
      cell.onButtonValueChanged = { print("Button tapped") }
      return cell
    case .none:
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
