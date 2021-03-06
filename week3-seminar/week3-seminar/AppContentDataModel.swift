//
//  AppContentDataModel.swift
//  week3-seminar
//
//  Created by 1v1 on 2021/10/23.
//

import Foundation
import UIKit

struct AppContentData {
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
