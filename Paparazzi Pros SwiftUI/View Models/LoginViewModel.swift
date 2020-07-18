//
//  LoginViewModel.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject{
    var isLoading = false
    var loginError = PaparazziError()
//    var hasError: Bool{
//        get{
//            loginError.kind == .None ? false : true
//        }
//    }
    private var user: User
    private var utilities = Util()
    
    @Published var isLoggedIn :Bool
    @Published var hasLoginError: Bool = false
    
    
    init(withEmail email: String, andPassword password: String){
        user = User(email: email, password: password)
        isLoggedIn = false
    }
    func authenticateUser(withUsername username: String, andPassword password: String) {
        loginError = validateFields(email: username, password: password)
        if loginError.kind != .None{
            print("User authentication Failed")
            print(loginError.description)
        }else{
            self.isLoggedIn = user.authenticateUsing(email: username, password: password)
            objectWillChange.send()
        }
        
    }
    
    func validateFields(email: String, password: String) -> (PaparazziError) {
        let emailString = email.trimmingCharacters(in: .whitespaces)
        let password = password.trimmingCharacters(in: .whitespaces)
        
        guard emailString.count > 0 else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Empty Email", descriptionDetail: "Email field cannot be empty.")
            hasLoginError = true
            return loginError
        }
        
        guard password.count > 0 else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Empty Password", descriptionDetail: "Password field cannot be empty.")
            hasLoginError = true
            return loginError
        }
        
        guard utilities.isEmailValid(email) == true else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Invalid Email", descriptionDetail: "Email is invalid.")
            hasLoginError = true
            return loginError
        }
        loginError = PaparazziError(kind: .None, description: "", descriptionDetail: "")
        hasLoginError = false
        return loginError
    }
}
