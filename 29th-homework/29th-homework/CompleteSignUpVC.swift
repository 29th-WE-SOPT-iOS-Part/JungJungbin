//
//  CompleteSignUpVC.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class CompleteVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    var receiveData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    private func setUpUI() {
        welcomeLabel.text = "\(receiveData) 님 환영합니다!"
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = .Blue
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 4
    }

}
