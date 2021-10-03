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
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = UIColor(named: "blue")
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 4
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
        nextVC.receiveData = nameTextField.text ?? ""
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }

}
