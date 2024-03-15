//
//  UserDefaultsService.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 14/03/24.
//

import UIKit

class UserDefaultsService {
    
    static let shared = UserDefaultsService()

    enum CurrentID: String {
        case customer_id
        case waiter_id
        case item_id
        case favorite_id
    }
    
    enum Token: String {
        case refresh
        case access
    }
    
    private enum Authentication: String {
        case email
        case password
    }
     
    private let storage: UserDefaults
    
    required init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }
    
    func getRefreshToken() -> String? {
        storage.value(forKey: Token.refresh.rawValue) as? String
    }
    
    func getAccessToken() -> String? {
        storage.value(forKey: Token.access.rawValue) as? String
    }
    
    func getKey(key: Token) -> String {
        return key.rawValue
    }
    
    func save(refreshToken: String?) {
        if let token = refreshToken {
            storage.setValue(token, forKey: Token.refresh.rawValue)
        } else {
            storage.setValue(nil, forKey: Token.refresh.rawValue)
        }
    }
    
    func save(accessToken: String?) {
        if let token = accessToken {
            storage.setValue("Bearer " + token, forKey: Token.access.rawValue)
        } else {
            storage.setValue(nil, forKey: Token.access.rawValue)
        }
    }
     
    func getByKey(key: Token) -> String {
        return storage.value(forKey: key.rawValue) as! String
    }
    
    func saveAuth(email: String, password: String) {
        storage.setValue(email, forKey: Authentication.email.rawValue)
        storage.setValue(password, forKey: Authentication.password.rawValue)
    }
    
    func getAuth() -> (String, String) {
        let email = storage.value(forKey: Authentication.email.rawValue) as! String
        let password = storage.value(forKey: Authentication.password.rawValue) as! String
        return (email, password)
    }
    
    func isHaveToken() -> Bool {
        if let _ = storage.value(forKey: Token.refresh.rawValue) as? String {
            return true
        }
        return false
    }
    
    func getCurrentID(key: CurrentID) -> String {
        storage.value(forKey: key.rawValue) as! String
    }
    
    func saveCurrentID(value: String, key: CurrentID) {
        storage.setValue(value, forKey: key.rawValue)
    }
}
