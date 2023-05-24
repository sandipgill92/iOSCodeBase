//
//  SwiftToast.swift
//  XPSBaseCode
//
//  Created by ios on 14/04/23.
//

import Foundation
import UIKit
import Toast_Swift

class SwiftToast {
    
    static let shared = SwiftToast()
    
    /// Show toast
    /// - Parameters:
    ///   - messsage: validation/error message
    ///   - view: UIView to show toast
    ///   - toastType: type of toast error or validation
    func showToast(messsage: String, view: UIView, toastType: ToastType) {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = toastType == .error ? .red:.black
        view.makeToast(messsage, duration: 3.0, position: .bottom, style: style)
    }
}

