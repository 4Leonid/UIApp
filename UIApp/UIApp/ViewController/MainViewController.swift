//
//  MainViewController.swift
//  UIApp
//
//  Created by Леонид Турко on 23.09.2024.
//

import UIKit


final class MainViewController: UIViewController {
  
  //private var mainView: MainView { view as! MainView } !!! Зачем эта строчка ??? Работает и так
  
  // MARK: - Lifecycle
  override func loadView() {
    view = MainView(frame: UIScreen.main.bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

