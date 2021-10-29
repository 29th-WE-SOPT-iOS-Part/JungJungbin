//
//  ShortsCollectionViewCell.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/27.
//

import Foundation
import UIKit

class ShortsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShortsCollectionViewCell"
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var chanelLabel: UILabel!
    
    func setData(chanelImage: UIImage, chanelName: String) {
        imgBtn.setImage(chanelImage, for: .normal)
        chanelLabel.text = chanelName
    }

}
