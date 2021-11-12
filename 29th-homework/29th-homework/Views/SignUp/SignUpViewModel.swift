//
//  SignUpViewModel.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/12.
//
// TODO: SignIn, SignUp 공통된 코드 묶어서 함수화..

import UIKit
import Alamofire

class SignUpViewModel {
    func requestSignUp(email: String, name: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.signUpURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeSignUpStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let error):
                print(error)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildSignUpData(data: data)
        case 400: return isVaildSignUpData(data: data) // .pathErr
        case 500: return isVaildSignUpData(data: data) // .serverErr
        default: return .networkFail
        }
    }
    
    private func isVaildSignUpData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data) else { return .pathErr }
        return .success(decodedData)
    }
}
