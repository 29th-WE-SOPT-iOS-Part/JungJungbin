//
//  LoginTextField.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/21.
//

import Foundation
import UIKit

class LoginTextField: UITextField {
    func setPaddingLR(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
