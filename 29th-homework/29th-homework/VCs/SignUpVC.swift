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
        setUpUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    @IBAction func tapShowPWBtn(_ sender: Any) {
        showPWBtn.isSelected.toggle()
        pwTextField.isSecureTextEntry.toggle()
        showPWBtn.tintColor = showPWBtn.isSelected ? .Blue : .gray
        
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
    private func setUpUI() {
        nextBtn.isEnabled = false
        nextBtn.titleLabel?.textColor = .white
        nextBtn.backgroundColor = .gray
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 4
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        pwTextField.delegate = self
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
