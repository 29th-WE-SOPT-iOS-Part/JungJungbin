//
//  SecondVC.swift
//  week7-seminar
//
//  Created by 1v1 on 2021/11/27.
//

import Foundation
import UIKit

class SecondVC: UIViewController {
    static let ID = "SecondVC"
    
    @IBOutlet weak var textField: UITextField!
    var receivedText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = receivedText
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"), object: textField.text ?? "")
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = textField.text
        dismiss(animated: true, completion: nil)
    }
    
    func setDataInTextField(data: String) {
        print("넘겨받은 data = \(data)")
    }
}
