//
//  LoginViewModel.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var loginError = PaparazziError(kind: .None, description: "", descriptionDetail: "")
    
    private var user: User
    private var utilities = Util()
    
    
    var isLoggedIn :Bool{
        get{
                return user.getIsLoggedIn()
        }
        set{
        }
    }
    
    
    
    init(withEmail email: String, andPassword password: String){
        user = User(email: email, password: password)
    }
    func authenticateUser(withUsername username: String, andPassword password: String) {
        if let _ = validateFields(email: username, password: password){
            print("User authentication Failed")
        }else{
            self.isLoggedIn = user.authenticateUsing(email: username, password: password)
            objectWillChange.send()
        }
        
    }
    
    func validateFields(email: String, password: String) -> (PaparazziError?) {
        let emailString = email.trimmingCharacters(in: .whitespaces)
        let password = password.trimmingCharacters(in: .whitespaces)
        
        guard emailString.count > 0 else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Empty Email", descriptionDetail: "Email field cannot be empty.")
            return loginError
        }
        
        guard password.count > 0 else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Empty Password", descriptionDetail: "Password field cannot be empty.")
            return loginError
        }
        
        guard utilities.isEmailValid(email) == true else {
            loginError = PaparazziError(kind: .invalidCharacters, description: "Invalid Email", descriptionDetail: "Email is invalid.")
            return loginError
            
        }
        return nil
    }
    
    private func handleError(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
    
}
