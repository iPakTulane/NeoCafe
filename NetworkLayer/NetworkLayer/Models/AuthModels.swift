//
//  AuthModels.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation

struct RegistrationResponse: Codable {
//    let message: String
}

struct VerificationCodeResponse: Codable {
    let email: String?
    let bonus: Double?
}

struct TokenResponse: Codable {
    let token: String?
}

