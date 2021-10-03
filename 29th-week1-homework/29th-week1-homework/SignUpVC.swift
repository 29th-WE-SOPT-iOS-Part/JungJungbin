//
//  SignUpVC.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var showPWBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        nextBtn.titleLabel?.textColor = .white
        nextBtn.backgroundColor = .gray
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 4
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        pwTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    @IBAction func tapShowPWBtn(_ sender: Any) {
        showPWBtn.isSelected.toggle()
        pwTextField.isSecureTextEntry.toggle()
        if showPWBtn.isSelected {
            showPWBtn.tintColor = UIColor(named: "blue")
        } else {
            showPWBtn.tintColor = .gray
        }
        
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
        nextVC.receiveData = nameTextField.text ?? ""
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.text != "" && emailTextField.text != "" && pwTextField.text != "" {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor(named: "blue")
        } else {
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = .gray
        }
    }
}