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
        guard let redVC = self.storyboard?.instantiateViewController(withIdentifier: "redVC"),
              let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "orangeVC"),
              let yellowVC = self.storyboard?.instantiateViewController(withIdentifier: "yellowVC"),
              let greenVC = self.storyboard?.instantiateViewController(withIdentifier: "greenVC"),
              let blueVC = self.storyboard?.instantiateViewController(withIdentifier: "blueVC")
        else { return }
        
        redVC.tabBarItem.title = "Home"
        redVC.tabBarItem.image = UIImage(systemName: "house")
        redVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        orangeVC.tabBarItem.title = "Profile"
        orangeVC.tabBarItem.image = UIImage(systemName: "person")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([redVC, orangeVC, yellowVC, greenVC, blueVC], animated: true)
    }
}
