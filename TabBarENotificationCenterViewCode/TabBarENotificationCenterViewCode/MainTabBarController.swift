//
//  ViewController.swift
//  TabBarENotificationCenterViewCode
//
//  Created by Eduardo Felipe das Neves Abido on 05/08/24.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tela01 = createNavController(viewController: Tela01VC(), title: "Tela 01", imagenName: "magnifyingglass")
        let tela02 = createNavController(viewController: Tela02VC(), title: "Tela 02", imagenName: "heart")
        let tela03 = createNavController(viewController: Tela03VC(), title: "Tela 03", imagenName: "star")
        
        viewControllers = [tela01, tela02, tela03]
        customizeTabBarAppearance()
    }
    
    private func createNavController(viewController: UIViewController, title: String, imagenName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imagenName)
        return navController
    }
    
    private func customizeTabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.5
    }
    
    
    
}
