//
//  TagCollectionViewCell.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/29.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "TagCollectionViewCell"
    @IBOutlet weak var tagLabel: UILabel!
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.layer.borderColor = CGColor(gray: 1, alpha: 1)
                contentView.backgroundColor = .darkGray
                tagLabel.textColor = .white
            } else {
                contentView.layer.borderColor = UIColor(named: "BtnStrokeGray")!.cgColor
                contentView.backgroundColor = .BtnBGGray
                tagLabel.textColor = .black
            }
        }
    }
    func setData(tagValue: String) {
        tagLabel.text = tagValue
    }
    
}
