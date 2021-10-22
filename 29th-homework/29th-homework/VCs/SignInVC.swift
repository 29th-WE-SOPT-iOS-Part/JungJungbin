//
//  ViewController.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var pwTextField: LoginTextField!
    @IBOutlet weak var newAccountBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    let commonInsets = UIEdgeInsets(top: 12, left: 14, bottom: 12, right: 14)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func tapNewAccountBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
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
        infoLabel.text = "Youtube도 이동하며 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
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

extension SignInVC: UITextFieldDelegate {
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
