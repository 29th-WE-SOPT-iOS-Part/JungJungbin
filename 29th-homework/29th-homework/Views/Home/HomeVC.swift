//
//  HomeVC.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/22.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    static let identifier = "HomeVC"
    struct ShortsDataForm {
        var channelName: String
        var channelImage: UIImage
    }
    
    struct VideoDataForm {
        var channelName: String
        var channelImage: UIImage
        var viewsM: Int
        var uploadWeeks: Int
        var title: String
        var thumbnailImage: UIImage
    }
    @IBOutlet weak var shortsCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var profileBtn: UIButton!
    
    var sampleShortsData: [ShortsDataForm] = [
        ShortsDataForm(channelName: "iOSPart", channelImage: UIImage(named: "ggamju1-0")!),
        ShortsDataForm(channelName: "AndroidPart", channelImage: UIImage(named: "ggamju1-1")!),
        ShortsDataForm(channelName: "ServerPart", channelImage: UIImage(named: "ggamju1-2")!),
        ShortsDataForm(channelName: "WebPart", channelImage: UIImage(named: "ggamju1-3")!),
        ShortsDataForm(channelName: "DesignPart", channelImage: UIImage(named: "ggamju1-4")!),
        ShortsDataForm(channelName: "PlanPart", channelImage: UIImage(named: "ggamju1-5")!)
    ]
    
    var sampleTagData: [String] = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
    
    var sampleVideoData: [VideoDataForm] = [
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", thumbnailImage: UIImage(named: "wesoptiOSPart")!),
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", thumbnailImage: UIImage(named: "wesoptiOSPart")!),
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", thumbnailImage: UIImage(named: "wesoptiOSPart")!),
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "4차 iOS 세미나 : Cocoapods & Networking, REST API", thumbnailImage: UIImage(named: "wesoptiOSPart")!),
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", thumbnailImage: UIImage(named: "wesoptiOSPart")!),
        VideoDataForm(channelName: "WE SOPT", channelImage: UIImage(named: "wesoptProfile")!, viewsM: 100, uploadWeeks: 3, title: "8차 끗", thumbnailImage: UIImage(named: "wesoptiOSPart")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        setUpDataSource()
        setUpUI()
        registerXib()
    }
    @IBAction func tapProfileBtn(_ sender: Any) {
//        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else { return }
//        nextVC.receiveData = nameTextField.text ?? ""
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func registerXib(){
        let xibName = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    func setUpUI() {
        videoTableView.separatorStyle = .none
        tagCollectionView.allowsSelection = true
    }
    func setUpDelegate() {
        videoTableView.delegate = self
        [shortsCollectionView, tagCollectionView].forEach {
            $0?.delegate = self
        }

    }
    func setUpDataSource() {
        videoTableView.dataSource = self
        [shortsCollectionView, tagCollectionView].forEach {
            $0?.dataSource = self
        }
    }
}
