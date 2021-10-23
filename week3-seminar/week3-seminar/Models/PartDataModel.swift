//
//  PartDataModel.swift
//  week3-seminar
//
//  Created by 1v1 on 2021/10/23.
//

import Foundation
import UIKit

struct PartData {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
