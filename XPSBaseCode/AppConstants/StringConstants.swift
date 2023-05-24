//
//  StringConstants.swift
//  Nextillo
//
//  Created by Sandip Gill on 15/07/22.
//

import Foundation

struct StringConstants {
    
    struct AlertMessages {
        static let logOutMessage = "Are you sure you want to logout?"
    }
    
    struct AppStrings {
        static let appName = ""
        static let tagline = ""
        static let loginTitle = ""
    }

    struct ValidationMessages {
        static let emptyEmail = "Please enter email."
        static let invalidEmail = "Please enter valid email."
        static let emptyPassword = "Please enter password."
        static let invalidPassword = "Password should have at least 6 chars, 1 uppercase, 1 lowercase, 1 number, and 1 special character."
    }
    
    struct ErrorMessages {
        static let noInternet = "No internet connection!"
        static let internalServerError = "Inernal server error!"
    }
}
