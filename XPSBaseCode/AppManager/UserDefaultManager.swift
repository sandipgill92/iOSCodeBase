//
//  UserDefaultManager.swift
//  SiteDrop
//
//  Created by Sandip Gill on 07/04/21.
//

import Foundation

class UserDefaultManager: NSObject {
    
    // MARK: - Keys
    private let kIsLoggedIn = "isLoggedIn"
    private let kAccessToken = "accessToken"
    private let kDeviceToken = "deviceToken"
    private let kisOTPVerified = "isOTPVerified"
    private let kIsWalkThrough = "isWalkThrough"
    private let kPersonalDetailsData = "PersonalDetailsData"
    private let kUserData = "userData"
    private let kScholershipRecord = "scholershipRecord"
    private let kExamData = "examData"
    private let kSelectedExam = "selectedExam"
    private let kFilterData = "filterData"
    private let kIsSkippedPurchase = "IsSkippedPurchase"
    
    static let shared = UserDefaultManager()
    
    // MARK: - Booleans
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: kIsLoggedIn)
            UserDefaults.standard.synchronize()
        }
    }

    // MARK: - String
    var apiAccessToken: String {
        get {
            return("\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: kAccessToken)
            UserDefaults.standard.synchronize()
        }
    }

    var deviceToken: String {
        get {
            return("\(UserDefaults.standard.value(forKey: kDeviceToken) ?? "fFpOZeOvF0zqmSM0P1Pc7b:APA91bFz8ywB_f0Ejugh3t5hjk-1z1zNkKUjpf0PHmJ7osynKMg0Oonp6gZdIVncfoW4SbkEdvRE_MJZpcY3NBNr8lVRURhKXsupon6KO3mmCkHH6_CTHg8WkT-UDsX5VLOxaEMFVK2B")")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: kDeviceToken)
            UserDefaults.standard.synchronize()
        }
    }

//    var userData: UserBaseModel? {
//        get {
//            return(UserDefaults.standard.retrieve(object: UserBaseModel.self, fromKey: kUserData))
//        }
//        set {
//            UserDefaults.standard.save(customObject: newValue, inKey: kUserData)
//            UserDefaults.standard.synchronize()
//        }
//    }
}

extension UserDefaults {
    
   func save<T: Encodable>(customObject object: T, inKey key: String) {
       let encoder = JSONEncoder()
       if let encoded = try? encoder.encode(object) {
           self.set(encoded, forKey: key)
       }
   }
    
   func retrieve<T: Decodable>(object type: T.Type, fromKey key: String) -> T? {
       if let data = self.data(forKey: key) {
           let decoder = JSONDecoder()
           if let object = try? decoder.decode(type, from: data) {
               return object
           } else {
               print("Couldnt decode object")
               return nil
           }
       } else {
           print("Couldnt find key")
           return nil
       }
   }
}
