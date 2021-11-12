//
//  UIViewControllerExtension.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/11.
//

import UIKit

extension UIViewController {
    func alert(title: String?, message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title ?? nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                completion?()
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
