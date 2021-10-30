//
//  LoginResponseDataModel.swift
//  week4-seminar
//
//  Created by 1v1 on 2021/10/30.
//

import Foundation

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
