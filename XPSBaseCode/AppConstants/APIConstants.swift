//
//  APIConstants.swift
//  Fitsentive
//
//  Created by Sandip Gill
//

import Foundation
import UIKit

struct APIConstants {

    static let deviceType = "IOS"
    
#if DEBUG
    static let baseUrl = "http://13.232.98.84:3000/api/v1/" // sandbox
#else
    static let baseUrl = "https://api.nextillo.com/api/v1/" // live
#endif
    
    struct EndPoints {
        static let login = baseUrl + "user/login"
    }
}
