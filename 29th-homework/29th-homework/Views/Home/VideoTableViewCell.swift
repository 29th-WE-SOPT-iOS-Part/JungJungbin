//
//  VideoTableViewCell.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/27.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    static let identifier = "VideoTableViewCell"
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    private func configureUI() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        thumbnailImageView.isUserInteractionEnabled = true
        thumbnailImageView.addGestureRecognizer(tapRecognizer)
    }

    func setData(thumbnailImg: UIImage, channelImage: UIImage, title: String, channelName: String, viewsM: Int, weeks: Int) {
        thumbnailImageView.image = thumbnailImg
        channelBtn.setImage(channelImage, for: .normal)
        titleLabel.text = title
        infoLabel.text = "\(channelName) ・ 조회수 \(viewsM)만회 ・ \(weeks)주 전"
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {

    }
}
