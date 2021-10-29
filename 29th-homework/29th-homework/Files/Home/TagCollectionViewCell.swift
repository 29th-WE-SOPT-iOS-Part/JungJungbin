//
//  TagCollectionViewCell.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/29.
//

import Foundation
import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "TagCollectionViewCell"
    @IBOutlet weak var tagLabel: UILabel!
    
    func setData(tagValue: String) {
        tagLabel.text = tagValue
    }
}
