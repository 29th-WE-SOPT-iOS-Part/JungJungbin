//
//  SignUpVC.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var pwTextField: LoginTextField!
    @IBOutlet weak var showPWBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    @IBAction func tapShowPWBtn(_ sender: Any) {
        showPWBtn.isSelected.toggle()
        pwTextField.isSecureTextEntry.toggle()
        showPWBtn.tintColor = showPWBtn.isSelected ? .Blue : .LightGray
        
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else { return }
        nextVC.receiveData = nameTextField.text ?? ""
        self.navigationController?.pushViewController(nextVC, animated: true)

    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    private func setUpUI() {
        nextBtn.isEnabled = false
        nextBtn.titleLabel?.textColor = .white
        nextBtn.backgroundColor = .gray
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 10.5
        [nameTextField, pwTextField, emailTextField].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.LightGray.cgColor
            $0?.layer.cornerRadius = nameTextField.frame.height / 6
            $0?.setPaddingLR(14.0)
            $0?.delegate = self
        }
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.text != "" && emailTextField.text != "" && pwTextField.text != "" {
            setUpNextBtn(status: true)
        } else {
            setUpNextBtn(status: false)
        }
    }
    private func setUpNextBtn(status: Bool) {
        nextBtn.isEnabled = status
        nextBtn.backgroundColor = status ? .Blue : .gray
    }
}
