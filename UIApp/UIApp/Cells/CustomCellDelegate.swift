//
//  CustomCellDelegate.swift
//  UIApp
//
//  Created by Леонид Турко on 23.09.2024.
//

protocol CellDelegate: AnyObject {
  func textFieldDidChange(with text: String)
  func showSliderNumber(_ text: String)
  func showButtonTapped()
  func showSwitchChanged(_ text: String)
}
