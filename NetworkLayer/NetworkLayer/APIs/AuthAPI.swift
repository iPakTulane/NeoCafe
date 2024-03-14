//
//  AuthAPI.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation
import Moya

enum AuthAPI  {
    case registerCustomer(email: String)
    case verifyRegistrationCode(email: String, code: String)
    case getToken(email: String, code: String)
}

extension AuthAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://neocafe-production.up.railway.app")!
    }
    
    var path: String {
        switch self {
        case .registerCustomer:
            "/api/register"
        case .verifyRegistrationCode:
            "/api/verifyRegistrationCode"
        case .getToken:
            "/api/auth/verifyCode"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerCustomer:
            return .post
        case .verifyRegistrationCode:
            return .post
        case .getToken:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .registerCustomer(let email):
            return .requestParameters(parameters: ["email": email], encoding: JSONEncoding.default)
        case .verifyRegistrationCode(let email, let code):
            return .requestParameters(parameters: ["email": email, "code": code], encoding: JSONEncoding.default)
        case .getToken(let email, let code):
            return .requestParameters(parameters: ["email": email, "code": code], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        if let token = UserDefaultsService.shared.getAccessToken() {
            return [
                "Content-Type": "application/json",
                "Authorization": token
            ]
        } else {
            return [
                "content-type": "application/json"
            ]
        }
    }
}
