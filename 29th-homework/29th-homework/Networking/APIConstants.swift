//
//  APIConstants.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/04.
//

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: Feature URL
    static let signInURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
}
