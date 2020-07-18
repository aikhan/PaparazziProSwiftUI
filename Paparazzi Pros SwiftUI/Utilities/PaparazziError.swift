//
//  PaparazziError.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 16/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import Foundation

public struct PaparazziError: Error {
    enum ErrorKind {
        case invalidCharacters
        case invalidCredentials
        case offlineError
        case unKnownError
        case None
    }
    
    var kind: ErrorKind
    var description: String
    var descriptionDetail :String
    
    init(kind: ErrorKind = .None, description: String = "", descriptionDetail: String = "") {
        self.kind = kind
        self.description = description
        self.descriptionDetail = descriptionDetail
    }
    
}
