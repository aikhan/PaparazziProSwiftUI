//
//  LoginViewModel.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject{
    var isLoading = false
    var loginError = PaparazziError()
    private var user: User
    private var utilities = Util()
    
    var cancelAble: AnyCancellable?
    
    @Published var isLoggedIn :Bool
    @Published var hasLoginError: Bool = false
    
    
    init(){
        user = User()
        isLoggedIn = false
    }
    func authenticateUser(withUsername username: String, andPassword password: String) {
        loginError = validateFields(email: username, password: password)
        if loginError.kind != .None{
            print("User authentication Failed")
            print(loginError.description)
        }else{
            isLoading = true
            let authPublisher = user.authenticateUser(withEmail: username, andPassword: password)
            cancelAble = authPublisher.sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion { self.loginError = error
                    self.isLoading = false
                    self.hasLoginError = true
                    print("Auth FAILED! \(self.loginError)")
                }
            }) {[unowned self] (value) in
                print("Auth SUCCESS! \(value)")
                self.isLoading = false
                self.isLoggedIn = value
            }
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
    deinit {
        cancelAble?.cancel()
    }
}
