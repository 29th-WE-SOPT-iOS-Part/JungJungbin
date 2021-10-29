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
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == shortsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(chanelImage: sampleShortsData[indexPath.row].chanelImage, chanelName: sampleShortsData[indexPath.row].chanelName)
            cell.imgBtn.layer.cornerRadius = cell.imgBtn.frame.height / 2
            return cell
        } else { // collectionView == tagCollectionView
            return UICollectionViewCell()
        }
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5 - 4 // 5개는 완전히 보여 주되 6번째 셀은 살짝.. 보이게
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
