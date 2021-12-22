//
//  PlayVideoVC.swift
//  29th-homework
//
//  Created by 1v1 on 2021/12/22.
//

import UIKit

class PlayVideoVC: UIViewController {
    static let ID = "PlayVideoVC"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var receivedData = VideoDataForm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        imageView.image = receivedData.thumbnailImage
        titleLabel.text = receivedData.title
        infoLabel.text = "조회수 \(receivedData.viewsM)만회 ・ \(receivedData.uploadWeeks)주 전"
    }
    
    @IBAction func tapDismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapExpandBtn(_ sender: Any) {
        // Expand ..
    }
}
