//
//  Progress.swift
//  Organisaur
//
//  Created by Sandip Gill on 21/04/22.
//

import Foundation
import MBProgressHUD

class Progress: NSObject {
    static let shared = Progress()
    var hud = MBProgressHUD()
    var window: UIWindow?
    override init() {
        window = UIApplication.shared.keyWindow
    }
    func show() {
        if let window = self.window {
            hud = MBProgressHUD.showAdded(to: window, animated: true)
            hud.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            hud.bezelView.color = .black
            hud.mode = .indeterminate
            hud.bezelView.style = .solidColor
            hud.contentColor = .white
        }
    }
    
    func hide() {
        if let window = self.window {
            MBProgressHUD.hide(for: window, animated: true)
        }
    }
}
