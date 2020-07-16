//
//  User.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

struct User {
    private var userName: String
    private var isLoggedIn = false
    private var isPaparazzi = false
    
    func authenticateUsing(username: String, password: String) -> Bool{
        print("User name is \(username) & password is \(password)")
        return true
    }
    
    func getIsLoggedIn() -> Bool{
         isLoggedIn
    }
}
