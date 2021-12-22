//
//  HomeVC-TV.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/29.
//

import UIKit

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleVideoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else { return UITableViewCell() }
        let curData = sampleVideoData[indexPath.row]
        cell.setData(thumbnailImg: curData.thumbnailImage, channelImage: curData.channelImage, title: curData.title, channelName: curData.channelName, viewsM: curData.viewsM, weeks: curData.uploadWeeks)
        
        let tapRecognizer = VideoInfoTapGesture(target: self, action: #selector(tapImageView(gesture:)))
        tapRecognizer.videoInfo = sampleVideoData[indexPath.row]
        cell.thumbnailImageView.isUserInteractionEnabled = true
        cell.thumbnailImageView.addGestureRecognizer(tapRecognizer)

        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.3768
    }
}
