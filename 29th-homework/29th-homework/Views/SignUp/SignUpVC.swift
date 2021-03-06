//
//  SignUpVC.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class SignUpVC: UIViewController {
    static let identifier = "SignUpVC"
    var viewModel = SignUpViewModel()
    
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
        viewModel.requestSignUp(email: emailTextField.text!, name: nameTextField.text!, password: pwTextField.text!) { responseData in
            switch responseData {
            case .success(let signInResponse):
                guard let response = signInResponse as? SignUpResponseData else { return }
                dPrint("userData", response.data as Any)
                if let userData = response.data { // 로그인을 정상적으로 성공해서 user Data가 들어왔을 때 WelcomeVC 띄우기
                    self.alert(title: "회원가입", message: response.message) {
                        guard let nextVC = UIStoryboard(name: "WelcomeVC", bundle: nil).instantiateViewController(withIdentifier: WelcomeVC.identifier) as? WelcomeVC else { return }
                        nextVC.receiveData = userData.name
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }
                } else {
                    self.alert(title: "회원가입", message: response.message, completion: nil)
                }
            case .requestErr(let msg):
                dPrint("request Err", msg)
                self.alert(title: "회원가입", message: "요청 오류로 회원 가입에 실패하였습니다.", completion: nil)
            case .pathErr:
                self.alert(title: "회원가입", message: "요청 오류로 회원 가입에 실패하였습니다.", completion: nil)
            case .serverErr:
                self.alert(title: "회원가입", message: "서버 오류로 회원 가입에 실패하였습니다.", completion: nil)
            case .networkFail:
                self.alert(title: "회원가입 실패", message: "네트워크 환경을 확인해 주세요.", completion: nil)
                
            }
        }
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
