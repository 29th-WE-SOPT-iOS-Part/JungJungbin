//
//  ViewController.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class SignInVC: UIViewController {
    static let identifier = "SignInVC"
    var viewModel = SignInViewModel()
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var pwTextField: LoginTextField!
    @IBOutlet weak var newAccountBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func tapNewAccountBtn(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: "SignUpVC", bundle: nil).instantiateViewController(withIdentifier: SignUpVC.identifier) as? SignUpVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func tapNextBtn(_ sender: Any) {
        viewModel.requestSignIn(email: emailTextField.text!, password: pwTextField.text!) { responseData in
            switch responseData {
            case .success(let signInResponse):
                guard let response = signInResponse as? SignInResponseData else { return }
                dPrint("userData", response.data as Any)
                if let userData = response.data { // 로그인을 정상적으로 성공해서 user Data가 들어왔을 때 WelcomeVC 띄우기
                    self.alert(title: "로그인", message: response.message) {
                        UserDefaults.standard.set(userData.name, forKey: UserDefaultsConst.shared.userName)
                        guard let nextVC = UIStoryboard(name: "WelcomeVC", bundle: nil).instantiateViewController(withIdentifier: WelcomeVC.identifier) as? WelcomeVC else { return }
                        if let userName = UserDefaults.standard.value(forKey: UserDefaultsConst.shared.userName) as? String {
                            nextVC.receiveData = userName
                        }
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }
                } else {
                    self.alert(title: "로그인", message: response.message, completion: nil)
                }
            case .requestErr(let msg):
                dPrint("request Err", msg)
                self.alert(title: "로그인", message: "요청 오류로 로그인에 실패하였습니다.", completion: nil)
            case .pathErr:
                self.alert(title: "로그인", message: "요청 오류로 로그인에 실패하였습니다.", completion: nil)
            case .serverErr:
                self.alert(title: "로그인", message: "서버 오류로 로그인에 실패하였습니다.", completion: nil)
            case .networkFail:
                self.alert(title: "로그인 실패", message: "네트워크 환경을 확인해 주세요.", completion: nil)
                
            }
        }
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    private func setUpUI() {
        infoLabel.text = "Youtube로 이동하며 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
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
