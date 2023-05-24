
import Foundation
import UIKit

enum AlertButtonType: String {
    case yes = "Yes"
    case no = "No"
    case cancel = "Cancel"
    case okay = "Okay"
}

class AlertViewManager: NSObject {

        /// This function show alert on current screen with dynamic functions
    static func showAlert(title: String? = StringConstants.AppStrings.appName,
                          message: String,
                          alertButtonTypes: [AlertButtonType]? = [.okay],
                          alertStyle: UIAlertController.Style? = nil,
                          completion: ((AlertButtonType) -> Void )? = nil ) {

        let style: UIAlertController.Style = alertStyle ?? .alert
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)

        for actionTitle in alertButtonTypes! {
            alertController.addAction(UIAlertAction(title: actionTitle.rawValue, style: .default, handler: {(alert: UIAlertAction!) in
                completion?(AlertButtonType(rawValue: alert.title!)!)
            }))
        }
        DispatchQueue.main.async {
            let controller = AppManager.shared.getPresentedViewController()
            controller?.present(alertController, animated: true, completion: nil)
        }
    }
}
