//
//  SignUpModel.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/12.
//

struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInResultData?
}

struct SignUpResultData: Codable {
    let id: Int
    let name, email: String
}
