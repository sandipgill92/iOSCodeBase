//
//  LoginInteractor.swift
//  XPSBaseCode
//
//  Created by Sandip Gill on 12/04/23.
//

import Foundation

class LoginInteractor: NSObject {
    
    var presenter: LoginPresenter? 
    
    func callLoginAPI(email: String, password: String, callback: callback<LoginEntity>) {

        let params = [APIKeys.deviceToken: UserDefaultManager.shared.deviceToken,
                      APIKeys.email: email,
                      APIKeys.password: password,
                      APIKeys.platformType: APIConstants.deviceType]
        Progress.shared.show()
        let header = [APIKeys.accept: "application/json",
                      APIKeys.contentType: "application/json"]
        ApiManager<LoginEntity>.makeApiCall(url: APIConstants.EndPoints.login,
                                                params: params,
                                                headers: header,
                                                method: .post) { _, responseModel in
            
//            if let statusCode = responseModel?.statusCode, let model = responseModel {
//
//                if statusCode == 200 {
//
//                } else {
//                    AlertViewManager.showAlert(message: responseModel?.message ?? StringConstants.ErrorMessages.somethingWent)
//                }
//            } else {
//                AlertViewManager.showAlert(message: responseModel?.message ?? StringConstants.ErrorMessages.somethingWent)
//            }
            Progress.shared.hide()
        }
    }
}
