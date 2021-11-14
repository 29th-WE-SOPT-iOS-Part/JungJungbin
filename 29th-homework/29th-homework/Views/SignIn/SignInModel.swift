//
//  SignInModel.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/11.
//

// SignInModel - SignIn 뷰에서 사용할 모델 정의

struct SignInResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInResultData?
}

struct SignInResultData: Codable {
    let id: Int
    let name, email: String
}
