//
//  String.swift
//  XPSBaseCode
//
//  Created by ios on 14/04/23.
//

import Foundation
import UIKit

extension String {
    
    var isEmpty: String {
        get {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    // Validate email address
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    // Validate password
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
