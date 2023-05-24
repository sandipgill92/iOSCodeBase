//
//  LoginRouter.swift
//  XPSBaseCode
//
//  Created by Sandip Gill on 12/04/23.
//

import Foundation

class HomeRouter: NSObject {
    
    var view: HomeVC!
    var presenter: HomePresenter!
    
    static func initilizeHomeView() -> HomeVC {
      
        let homeVC = R.storyboard.main.homeVC()
        
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = homeVC
        presenter.view = homeVC
        homeVC?.presenter = presenter
        return homeVC!
    }
}
