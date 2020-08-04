//
//  Profile.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 20/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation


struct Profile {
    var firstName :String?
    var lastName :String?
    var telephoneNumber: String?
    var sendMeEmailsConcent: Bool = false
    var location: Location? = nil
    var email = ""
    var password  = ""//Store it in the keychain
    
    
    struct Location{
        var longtitude: Double
        var latitude: Double
        var locationName: String?
    }
    func fetchPasswordFromKeyChain(ofEmail email: String) -> String? {
        return password
    }
    
    func fetchProfileDetails(ofEmail email: String) -> Profile{
        
        return Profile()
    }
    
    
}

