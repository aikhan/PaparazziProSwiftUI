//
//  User.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

struct User {
    private var email: String
    private var password: String
    private var isLoggedIn = false
    private var isPaparazzi = false
    
    func authenticateUsing(email: String, password: String) -> Bool{
        print("User name is \(email) & password is \(password)")
        return true
    }
        
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
  
   mutating func setIsLoggedIn(value: Bool){
        isLoggedIn = value
    }
    func getIsLoggedIn() -> Bool{
         isLoggedIn
    }
}
