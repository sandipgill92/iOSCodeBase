//
//  LoginVC.swift
//  XPSBaseCode
//
//  Created by Sandip Gill on 12/04/23.
//

import UIKit

class LoginVC: UIViewController {

    /// Variables
    var presenter: LoginPresenter?
    
    /// Outlets
    @IBOutlet weak var lbltagLine: UILabel!
    @IBOutlet weak var imgVwLogo: UIImageView!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    /// View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    func setUpUI() {
        DispatchQueue.main.async {
            self.txtFldEmail.setLeftPadding(5)
            self.txtFldPassword.setLeftPadding(5)
            self.txtFldEmail.setRightPadding(5)
            self.txtFldEmail.setRightPadding(5)
        }
    }
    
    // MARK: - Button Actions 
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        self.presenter?.loginPressed()
    }
}

