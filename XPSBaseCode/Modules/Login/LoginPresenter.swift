//
//  LoginPresenter.swift
//  XPSBaseCode
//
//  Created by Sandip Gill on 12/04/23.
//

import Foundation

class LoginPresenter: NSObject {
    
    /// Variables
    var router: LoginRouter!
    var interactor: LoginInteractor!
    var view: LoginVC!
    
    /// Login Button Pressed
    func loginPressed() {
        if self.validateData().0 {
            self.requestLogin()
        } else {
            SwiftToast.shared.showToast(messsage: self.validateData().1, view: self.view.view, toastType: .validation)
        }
    }
    
    
    /// Validate user inputs
    /// - Returns: Return status and validation message
    private func validateData() -> (Bool,String) {
        
        if self.view.txtFldEmail.text!.isEmpty {
            
            return (false, StringConstants.ValidationMessages.emptyEmail)
        } else if !self.view.txtFldEmail.text!.isValidEmail() {
            
            return (false, StringConstants.ValidationMessages.invalidEmail)
        } else if self.view.txtFldPassword.text!.isEmpty {
            
            return (false, StringConstants.ValidationMessages.emptyPassword)
        } else if !self.view.txtFldPassword.text!.isValidPassword() {
            
            return (false, StringConstants.ValidationMessages.invalidPassword)
        } else {
            
            return (true, "")
        }
    }
    
    /// Request to interactor for login
    private func requestLogin() {
        self.interactor?.callLoginAPI(email: "", password: "") { status, responseModel, error  in
            if status {
                self.router?.moveToHome()
            } else {
                SwiftToast.shared.showToast(messsage: self.validateData().1, view: self.view.view, toastType: .error)
            }
        }
    }
}
