//
//  FirstVC.swift
//  week7-seminar
//
//  Created by 1v1 on 2021/11/27.
//

import Foundation
import UIKit

class FirstVC: UIViewController {
    static let ID = "FirstVC"
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.ID) as? SecondVC else { return }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("iOS-Sample"),
                                               object: nil)
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            textField.text = text
        }
    }
}
