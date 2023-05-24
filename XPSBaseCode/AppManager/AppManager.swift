
import UIKit
import CoreLocation
class AppManager: NSObject {

    static let shared = AppManager()
    
    /// This function will get presented ViewController
    func getPresentedViewController() -> UIViewController? {

        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func setLoginAsRoot() {

        let loginVC = LoginRouter.initilizeLoginView()
        let navigation = UINavigationController(rootViewController: loginVC)
        navigation.isNavigationBarHidden = true
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let window = appDelegate.window else { return }
        window.rootViewController = navigation
        UIView.transition(with: window,
                             duration: 0.3,
                             options: .transitionCrossDissolve,
                             animations: nil,
                             completion: nil)
    }

    func setDashboardAsRoot() {
        let homeVC = HomeRouter.initilizeHomeView()
        let navigation = UINavigationController(rootViewController: homeVC)
        navigation.isNavigationBarHidden = true
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let window = appDelegate.window else { return }
        window.rootViewController = navigation
        UIView.transition(with: window,
                             duration: 0.3,
                             options: .transitionCrossDissolve,
                             animations: nil,
                             completion: nil)
    }

    /// This methods used to parse data to a codable model
    /// - Parameters:
    ///   - modelType: This is any data model to parse json
    ///   - data: data is API response data
    /// - Returns: It will return parsed data as model
    func decode<T: Codable>(modelType: T.Type, data: Data) -> T? {
        guard let model = try? JSONDecoder().decode(modelType, from: data) else { return nil }
        return model
    }
    
    /// Converts any Object to json String
    /// - Parameter object: get any object
    /// - Returns: return converted json string 
    func jsonString(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        let jsonString = String(data: data, encoding: String.Encoding.utf8)
        return jsonString
    }
}
