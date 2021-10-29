//
//  HomeVC-CV.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/27.
//

import Foundation
import UIKit

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == shortsCollectionView {
            return sampleShortsData.count
        } else { // collectionView == tagCollectionView
            return sampleTagData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == shortsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(channelImage: sampleShortsData[indexPath.row].channelImage, channelName: sampleShortsData[indexPath.row].channelName)
            cell.imgBtn.layer.cornerRadius = cell.imgBtn.frame.height / 2
            
            if indexPath.item == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
            }
            
            return cell
            
        } else { // collectionView == tagCollectionView
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(tagValue: sampleTagData[indexPath.row])
            cell.contentView.layer.cornerRadius =  cell.contentView.frame.height / 2
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor(named: "BtnStrokeGray")!.cgColor
            return cell
        }
    }
    
    
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == shortsCollectionView {
            let width = collectionView.frame.width / 5 - 4 // 5개는 완전히 보여 주되 6번째 셀은 살짝.. 보이게
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        } else { // collectionView == tagCollectionView
            let width = sampleTagData[indexPath.row].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 29
            let height = collectionView.frame.height * 0.6
            return CGSize(width: width, height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == shortsCollectionView {
            return UIEdgeInsets.zero
        } else { // collectionView == tagCollectionView
            return UIEdgeInsets(top: 0, left: 4.5, bottom: 0, right: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == shortsCollectionView {
            return 0
        } else { // collectionView == tagCollectionView
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == shortsCollectionView {
            return 0
        } else { // collectionView == tagCollectionView
            return 4.5
        }
    }
}


