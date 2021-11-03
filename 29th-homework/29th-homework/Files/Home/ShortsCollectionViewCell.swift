//
//  ShortsCollectionViewCell.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/27.
//

import UIKit

class ShortsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShortsCollectionViewCell"
    @IBOutlet weak var imgBtn: UIButton! {
        didSet {
            imgBtn.layer.cornerRadius = imgBtn.frame.height / 2
        }
    }
    @IBOutlet weak var channelLabel: UILabel!
    func setData(channelImage: UIImage, channelName: String) {
        imgBtn.setImage(channelImage, for: .normal)
        channelLabel.text = channelName
    }
    

}
