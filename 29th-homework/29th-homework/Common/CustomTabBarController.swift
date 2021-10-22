//
//  CustomTabBarController.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/22.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVC"),
              let subVC = self.storyboard?.instantiateViewController(withIdentifier: "SubVC"),
              let libraryVC = self.storyboard?.instantiateViewController(withIdentifier: "LibraryVC")
        else { return }
        
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        shortsVC.tabBarItem.title = "Profile"
        shortsVC.tabBarItem.image = UIImage(systemName: "person")
        shortsVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([redVC, orangeVC, yellowVC, greenVC, blueVC], animated: true)
    }
}
