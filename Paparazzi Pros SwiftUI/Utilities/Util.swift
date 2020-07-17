//
//  Util.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 16/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation
struct Util {
    
    func isEmailValid(_ checkString: String?) -> Bool {
        let emailString = checkString?.trimmingCharacters(in: .whitespaces)
        var isValid = false
        var emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        var emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isValid = emailTest.evaluate(with: emailString)
        
        if isValid == true {
            let stringArray = emailString?.components(separatedBy: "@")
            let nameString = stringArray![0] as String
            emailRegex = ".*[a-zA-Z]+.*"
            emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            isValid = emailTest.evaluate(with: nameString)
            
        }
        return isValid
    }
}
