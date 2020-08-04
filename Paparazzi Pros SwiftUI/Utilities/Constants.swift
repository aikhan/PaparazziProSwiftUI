//
//  Constants.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//


import CoreGraphics
struct Constants {
    
    // MARK: - Fonts
    static let MONTSERRAT_BOLD = "Montserrat-Bold"
    static let MONTSERRAT_LIGHT = "Montserrat-Light"
    static let MONTSERRAT_REGULAR = "Montserrat-Regular"
    static let MONTSERRAT_BLACK = "Montserrat-Black"
    static let MONTSERRAT_HAIRLINE = "Montserrat-Hairline"
    
    // MARK: - Colors
    static let COLOR_FONT_HEADINGS = "#4A4A4A"
    static let COLOR_MAIN_BACKGROUND = "#E5EBED"
    static let COLOR_LIGHT_BACKGROUND = "#FFFFFF"
    static let COLOR_PLACEHOLDER_TEXT = "#434A54"
    
    static let COLOR_BUTTON_RED_BRIGHT = "#D0021B"
    static let COLOR_BUTTON_FACEBOOK = "#1A4074"
    static let COLOR_BUTTON_RED_DARK = "#94101F"
    
    // MARK: - Font Sizes
    static let FONT_SIZE_MAIN: CGFloat = 19.0
    static let FONT_SIZE_REGULAR: CGFloat = 15.0
    
    // MARK: - View Constants
    static let RADIUS_VIEW_CORNER: CGFloat = 9.0
    static let RADIUS_SUBVIEW_CORNER: CGFloat = 25.0
    
    
    
    private init() {}
    
    
    struct API{
        
        private init() {}
        
    }
}

public enum UserType {
    case Paparazzi
    case Customer
    case None
}



