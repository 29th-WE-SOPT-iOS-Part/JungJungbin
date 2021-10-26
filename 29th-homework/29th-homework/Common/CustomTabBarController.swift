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
        guard let homeVC = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC,
              let shortsVC = UIStoryboard(name: "ShortsVC", bundle: nil).instantiateViewController(withIdentifier: "ShortsVC") as? ShortsVC,
              let addVC = UIStoryboard(name: "AddVC", bundle: nil).instantiateViewController(withIdentifier: "AddVC") as? AddVC,
              let subVC = UIStoryboard(name: "SubVC", bundle: nil).instantiateViewController(withIdentifier: "SubVC") as? SubVC,
              let libraryVC = UIStoryboard(name: "LibraryVC", bundle: nil).instantiateViewController(withIdentifier: "LibraryVC") as? LibraryVC
        else { return }
        
        setTabBarItem(homeVC, title: "홈", image: .homeIcon, selectedImage: .homeIconFill)
        setTabBarItem(shortsVC, title: "Shorts", image: .shortsIcon, selectedImage: .shortsIconFill)
        setTabBarItem(addVC, title: "추가", image: .plusCircleIcon, selectedImage: .plusCircleIcon)
        setTabBarItem(subVC, title: "구독", image: .subscriptionsIcon, selectedImage: .subscriptionsIconFill)
        setTabBarItem(libraryVC, title: "보관함", image: .libraryIcon, selectedImage: .libraryIconFill)
//        homeVC.tabBarItem.title = "홈"
//        homeVC.tabBarItem.image = .homeIcon
//        homeVC.tabBarItem.selectedImage = .homeIconFill
//
//        shortsVC.tabBarItem.title = "Shorts"
//        shortsVC.tabBarItem.image = .shortsIcon
//        shortsVC.tabBarItem.selectedImage = .shortsIconFill
//
//        addVC.tabBarItem.title = "추가"
//        addVC.tabBarItem.image = .plusCircleIcon
//        addVC.tabBarItem.selectedImage = .plusCircleIcon
//
//        subVC.tabBarItem.title = "구독"
//        subVC.tabBarItem.image = .subscriptionsIcon
//        subVC.tabBarItem.selectedImage = .subscriptionsIconFill
//
//        libraryVC.tabBarItem.title = "보관함"
//        libraryVC.tabBarItem.image = .libraryIcon
//        libraryVC.tabBarItem.selectedImage = .libraryIconFill
        
        setViewControllers([homeVC, shortsVC, addVC, subVC, libraryVC], animated: true)
    }
    private func setTabBarItem(_ VC: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        VC.tabBarItem.selectedImage = selectedImage
    }
}
