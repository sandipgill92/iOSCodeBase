//
//  LoginRouter.swift
//  XPSBaseCode
//
//  Created by Sandip Gill on 12/04/23.
//

import Foundation

class LoginRouter: NSObject {
    
    /// Variables
    var view: LoginVC!
    var presenter: LoginPresenter!
    
    /// Initilizes the LoginVC and setup VIPER
    /// - Returns: It returns the LoginVC Object
    static func initilizeLoginView() -> LoginVC {
      
        let loginVC = R.storyboard.main.loginVC()
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
        
        presenter.view = loginVC
        loginVC?.presenter = presenter
        return loginVC!
    }
    
    /// Redirects to HomeVC 
    func moveToHome() {
        let homeVC = HomeRouter.initilizeHomeView()
        self.view.navigationController?.pushViewController(homeVC, animated: true)
    }
}
