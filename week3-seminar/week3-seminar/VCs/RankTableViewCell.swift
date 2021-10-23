//
//  RankTableViewCell.swift
//  week3-seminar
//
//  Created by 1v1 on 2021/10/23.
//

import UIKit

class RankTableViewCell: UITableViewCell {
    static let identifier = "RankTableViewCell"
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var openBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(rank: Int, appData: AppContentData) {
        rankLabel.text = "\(rank)"
        appIconImageView.image = appData.makeImage()
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
    }
    
}
