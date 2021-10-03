//
//  ResultViewController.swift
//  29th-week1-seminar
//
//  Created by 1v1 on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var message: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setMsgInLabel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setMsgInLabel() {
        if let msg = message {
            textLabel.text = msg
            textLabel.sizeToFit()
        }
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
