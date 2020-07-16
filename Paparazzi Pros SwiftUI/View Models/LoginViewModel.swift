//
//  LoginViewModel.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

class LoginViewModel{
    private var user: User
    var isLoggedIn :Bool{
            return user.getIsLoggedIn()
    }
    
    init(user: User) {
        self.user = user
    }
    
    func authenticateUser(username: String, password: String) -> Bool {
        user.authenticateUsing(username: username, password: password)
    }
    
}
