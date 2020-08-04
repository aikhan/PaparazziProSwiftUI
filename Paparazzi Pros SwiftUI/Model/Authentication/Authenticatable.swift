//
//  AuthenticationProtocol.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 17/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation
import Combine

public protocol Authenticatable {
    
    var isAuthenticated: Bool {get set}
    var userType: UserType {get set}
    
    mutating func signOut()
}


public protocol AuthenticatableOAuth: Authenticatable{
    func authenticateUser(usingOAuthProvider provider: AuthenticationType, withAPIKey key: String) throws 
}

public protocol AuthenticatableCredentials: Authenticatable{
    func authenticateUser(withEmail email: String, andPassword password: String) -> Future<Bool, PaparazziError>
}

public enum AuthenticationType{
    case Firebase
    case Facebook
    case Google
    case Custom
}
