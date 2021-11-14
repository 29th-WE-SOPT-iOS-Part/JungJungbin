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
        guard let homeVC = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(withIdentifier: HomeVC.identifier) as? HomeVC,
              let shortsVC = UIStoryboard(name: "ShortsVC", bundle: nil).instantiateViewController(withIdentifier: ShortsVC.identifier) as? ShortsVC,
              let addVC = UIStoryboard(name: "AddVC", bundle: nil).instantiateViewController(withIdentifier: AddVC.identifier) as? AddVC,
              let subVC = UIStoryboard(name: "SubscribeVC", bundle: nil).instantiateViewController(withIdentifier: SubscribeVC.identifier) as? SubscribeVC,
              let libraryVC = UIStoryboard(name: "LibraryVC", bundle: nil).instantiateViewController(withIdentifier: LibraryVC.identifier) as? LibraryVC
        else { return }
        
        setTabBarItem(homeVC, title: "홈", image: .homeIcon, selectedImage: .homeIconFill)
        setTabBarItem(shortsVC, title: "Shorts", image: .shortsIcon, selectedImage: .shortsIconFill)
        setTabBarItem(addVC, title: "추가", image: .plusCircleIcon, selectedImage: .plusCircleIcon)
        setTabBarItem(subVC, title: "구독", image: .subscriptionsIcon, selectedImage: .subscriptionsIconFill)
        setTabBarItem(libraryVC, title: "보관함", image: .libraryIcon, selectedImage: .libraryIconFill)
        
        setViewControllers([homeVC, shortsVC, addVC, subVC, libraryVC], animated: true)
    }
    private func setTabBarItem(_ VC: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        VC.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    }
}
