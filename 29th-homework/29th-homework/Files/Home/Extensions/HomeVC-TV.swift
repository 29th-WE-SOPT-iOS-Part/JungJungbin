//
//  HomeVC-TV.swift
//  29th-homework
//
//  Created by 1v1 on 2021/10/29.
//

import Foundation
import UIKit

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension HomeVC: UITableViewDelegate {
    
}

