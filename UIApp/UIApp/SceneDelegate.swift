//
//  SceneDelegate.swift
//  UIApp
//
//  Created by Леонид Турко on 23.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    window?.rootViewController = MainViewController()
    window?.makeKeyAndVisible()
  }
}

