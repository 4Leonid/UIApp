//
//  TableCellFactory.swift
//  UIApp
//
//  Created by Леонид Турко on 24.09.2024.
//

import UIKit

final class TableCellFactory {
  
  weak var delegate: MainViewController?
  private var text: String?
  
  let elementsofUI = [UILabel(), UITextField(), UISlider(), UISwitch(), UITextView(), UIButton(), UIStepper()]
  
  func makeCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.reuseIdentifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
      let text = "\(indexPath.row)"
      cell.configure(with: text)
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
      cell.delegate = delegate
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderCell.reuseIdentifier, for: indexPath) as? SliderCell else { return UITableViewCell() }
      cell.delegate = delegate
      return cell
    case 3:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.reuseIdentifier, for: indexPath) as? SwitchCell else { return UITableViewCell() }
      cell.delegate = delegate
      return cell
    case 4:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.reuseIdentifier, for: indexPath) as? TextViewCell else { return UITableViewCell() }
      return cell
    case 5:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: StepperCell.reuseIdentifier, for: indexPath) as? StepperCell else { return UITableViewCell() }
      cell.delegate = delegate
      return cell
      
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as? ButtonCell else { return UITableViewCell() }
      cell.delegate = delegate
      return cell
    }
  }
}
