//
//  User.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth

struct User: Authenticatable {

    var userType: UserType = .None
    var profile: Profile = Profile()

    var isAuthenticated: Bool {
        get{
            let defaults = UserDefaults.standard
            return defaults.bool(forKey: "isAuthenticated")
        }
        set{
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "isAuthenticated")
        }
    }
    
    mutating func signOut() {
        do{
            try Auth.auth().signOut()
            isAuthenticated = false
        }
        catch{
            print("Error : \(error.localizedDescription)")
        }
        
    }
}

extension User: AuthenticatableCredentials{
    func authenticateUser(withEmail email: String, andPassword password: String) -> Future<Bool, PaparazziError> {
        print("Authenticte with username and password using Firebase")
        let future = Future<Bool, PaparazziError> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("Emit Error + \(error.localizedDescription)")
                    promise(.failure(.init(kind: .invalidCredentials, description: "Error", descriptionDetail: error.localizedDescription)))
                }else{
                    let defaults = UserDefaults.standard
                    defaults.set(true, forKey: "isAuthenticated")
                    promise(.success(true))
                }
            }        }
        return future
    }
}

extension User: AuthenticatableOAuth{
    func authenticateUser(usingOAuthProvider provider: AuthenticationType, withAPIKey key: String) throws {
        guard provider != .Google || provider != .Facebook else {
            let error = PaparazziError.init(kind: .invalidOAuthProvider, description: "Invalid OAuth Provider", descriptionDetail: "Another OAuth Provider used instead of \(provider)")
            throw error
        }
        _ = provider == .Facebook ? authenticateUsingFacebook(usingAPIKey: key) : authenticateUsingGoogle(usingAPIKey: key)
    }
    
    func authenticateUsingFacebook(usingAPIKey key: String) -> Bool {
        return true
    }
    func authenticateUsingGoogle(usingAPIKey key: String) -> Bool {
        return true
    }
}
