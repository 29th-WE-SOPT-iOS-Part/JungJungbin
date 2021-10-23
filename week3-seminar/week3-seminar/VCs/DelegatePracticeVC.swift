//
//  DelegatePracticeVC.swift
//  week3-seminar
//
//  Created by 1v1 on 2021/10/23.
//

import UIKit

class DelegatePracticeVC: UIViewController {

    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partPickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
}

extension DelegatePracticeVC: UITextFieldDelegate {
    // 편집 시작
    func textFieldDidBeginEditing(_ textField: UITextField) {
#if DEBUG
        print("textFieldDidBeginEditing called")
#endif
    }
    
    // 키보드 내려가고 완전 end
    func textFieldDidEndEditing(_ textField: UITextField) {
#if DEBUG
        print("textFieldDidEndEditing called")
#endif
    }
    // 편집 끝내기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
#if DEBUG
        print("textFieldShouldReturn called")
#endif
        textField.endEditing(true)
        return true
    }
}
