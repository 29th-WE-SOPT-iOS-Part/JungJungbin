//
//  HomeVC-CV.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/27.
//

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
        switch collectionView {
        case shortsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(channelImage: sampleShortsData[indexPath.row].channelImage, channelName: sampleShortsData[indexPath.row].channelName)
            
            if indexPath.item == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
            }
            return cell
            
        case tagCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(tagValue: sampleTagData[indexPath.row])
            cell.contentView.layer.cornerRadius =  cell.contentView.frame.height / 2
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.BtnStrokeGray.cgColor
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case shortsCollectionView:
            let width = collectionView.frame.width / 5 - 4 // 5개는 완전히 보여 주되 6번째 셀은 살짝.. 보이게
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        case tagCollectionView:
            let width = sampleTagData[indexPath.row].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 29
            let height = collectionView.frame.height * 0.6
            return CGSize(width: width, height: height)
        default:
            return CGSize()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case shortsCollectionView:
            return UIEdgeInsets.zero
        case tagCollectionView:
            return UIEdgeInsets(top: 0, left: 4.5, bottom: 0, right: 0)
        default:
            return UIEdgeInsets()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case shortsCollectionView:
            return 0
        case tagCollectionView:
            return 4.5
        default:
            return CGFloat()
        }
    }
}


