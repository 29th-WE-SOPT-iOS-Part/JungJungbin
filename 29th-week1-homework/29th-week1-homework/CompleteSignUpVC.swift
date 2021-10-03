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
        welcomeLabel.text = "\(receiveData) 님 환영합니다!"
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = UIColor(named: "blue")
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 4

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
