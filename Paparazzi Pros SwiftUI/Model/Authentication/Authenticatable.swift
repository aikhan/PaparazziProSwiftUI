//
//  AuthenticationProtocol.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 17/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

public protocol Authenticatable {
    
    func authenticateUser(withEmail: String, andPassword: String,
                              completionHandler: @escaping (Bool?, PaparazziError?) -> Void)
}
