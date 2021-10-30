//
//  ViewController.swift
//  week4-seminar
//
//  Created by 1v1 on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapDoneBtn(_ sender: Any) {
        requestLogin()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "", password: pwTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message, message: "\(userData.name)님 환영합니다!")
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
