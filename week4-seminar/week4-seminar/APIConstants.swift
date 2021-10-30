//
//  APIConstants.swift
//  week4-seminar
//
//  Created by 1v1 on 2021/10/30.
//

import Foundation

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: Feature URL
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user/"
}


