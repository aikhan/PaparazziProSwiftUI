//
//  PaparazziError.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 16/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

struct PaparazziError: Error {
    enum ErrorKind {
        case invalidCharacters
        case invalidCredentials
        case unKnownError
        case None
    }
    
    let kind: ErrorKind
    let description: String
    let descriptionDetail: String
}
