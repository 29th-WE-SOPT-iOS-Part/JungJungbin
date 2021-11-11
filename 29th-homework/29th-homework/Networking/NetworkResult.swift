//
//  NetworkResult.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/09.
//

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
