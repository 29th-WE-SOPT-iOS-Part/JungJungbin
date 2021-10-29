//
//  HomeVC.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/22.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    struct ShortsDataForm {
        var chanelName: String
        var chanelImage: UIImage
    }
    @IBOutlet weak var shortsCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    
    var sampleShortsData: [ShortsDataForm] = [
        ShortsDataForm(chanelName: "iOSPart", chanelImage: UIImage(named: "ggamju1-0")!),
        ShortsDataForm(chanelName: "AndroidPart", chanelImage: UIImage(named: "ggamju1-1")!),
        ShortsDataForm(chanelName: "ServerPart", chanelImage: UIImage(named: "ggamju1-2")!),
        ShortsDataForm(chanelName: "WebPart", chanelImage: UIImage(named: "ggamju1-3")!),
        ShortsDataForm(chanelName: "DesignPart", chanelImage: UIImage(named: "ggamju1-4")!),
        ShortsDataForm(chanelName: "PlanPart", chanelImage: UIImage(named: "ggamju1-5")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.delegate = self
        videoTableView.dataSource = self
        shortsCollectionView.delegate = self
        shortsCollectionView.dataSource = self
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
    }
}
