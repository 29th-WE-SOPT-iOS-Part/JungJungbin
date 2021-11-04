//
//  WelcomeVC.swift
//  29th-week1-homework
//
//  Created by 1v1 on 2021/10/03.
//

import UIKit

class WelcomeVC: UIViewController {
    static let identifier = "WelcomeVC"
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    var receiveData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    private func setUpUI() {
        welcomeLabel.text = "\(receiveData) 님\n환영합니다!"
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = .Blue
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 10.5
    }
    @IBAction func tapAddAcountBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func tapOKBtn(_ sender: Any) {
        guard let nextTabBar = UIStoryboard(name: "TabBarHome", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController else { return }
        nextTabBar.modalPresentationStyle = .fullScreen
        self.present(nextTabBar, animated: true, completion: nil)
        
        
    }
    
}
