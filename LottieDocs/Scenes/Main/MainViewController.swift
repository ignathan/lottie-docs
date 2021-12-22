//
//  MainViewController.swift
//  LottieDocs
//
//  Created by AD0507-ADE-MB-1 on 22/12/2021.
//

import UIKit

class MainViewController: UITabBarController {
    
    var homeVC: UIViewController = {
        return HomeViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNVC = UINavigationController(rootViewController: homeVC)
        let homeItem = UITabBarItem(title: "HOME", image: UIImage(named: "tab_home"), tag: 0)
        homeNVC.tabBarItem = homeItem
        
        viewControllers = [homeNVC]
    }
}
