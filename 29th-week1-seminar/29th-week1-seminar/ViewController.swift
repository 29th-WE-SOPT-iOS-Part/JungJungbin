//
//  ViewController.swift
//  29th-week1-seminar
//
//  Created by 1v1 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        label.text = "1차 세미나"
        label.sizeToFit()
    }
    @IBAction func touchUpToGoSecondView(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.modalTransitionStyle = .crossDissolve
//        self.present(nextVC, animated: true, completion: nil)
    }
    

}

