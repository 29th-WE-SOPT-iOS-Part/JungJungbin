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
    
    var partList: [PartData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        partPickerView.dataSource = self
        partPickerView.delegate = self
        
        initPartData()
        partImageView.image = partList[0].makeImage()
        textField.text = partList[0].partName
    }
    
    func initPartData() {
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
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

extension DelegatePracticeVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
    
    
}

extension DelegatePracticeVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partImageView.image = partList[row].makeImage()
        textField.text = partList[row].partName
    }
}
