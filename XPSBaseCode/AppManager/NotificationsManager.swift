//
//  NotificationsManager.swift
//  Organisaur
//
//  Created by Sandip Gill on 27/06/22.
//

import Foundation
import UIKit
import UserNotificationsUI
import FirebaseCore
import FirebaseMessaging

extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {

    func registerNotifications(_ application: UIApplication) {

        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions) { _, _ in }
        application.registerForRemoteNotifications()

        FirebaseApp.configure()
        Messaging.messaging().delegate = self

        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print(request)
            }
        })
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

        UserDefaultManager.shared.deviceToken = fcmToken ?? "1234567890"
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([[.sound], .banner, .banner])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
       // handleBadgeCount()
        if let userInfo = response.notification.request.content.userInfo as? [String: Any] {
            self.handlePushNotification(userInfo: userInfo)
        }
        completionHandler()
    }
    
    func handlePushNotification(userInfo: [String: Any]) {
        
//        if notification.type == .announcementCreated {
//            AppManager.shared.setDashboardAsRoot(selectedTab: .home)
//        } else if notification.type == .mockTestCreated {
//
//            guard let mockTestVC = R.storyboard.practice.mockTestViewController() else { return }
//            self.controller.navigationController?.pushViewController(mockTestVC, animated: true)
//        } else if notification.type == .quizCreated {
//            
//            guard let quizVC = R.storyboard.practice.quizViewController() else { return }
//            self.controller.navigationController?.pushViewController(quizVC, animated: true)
//        }
    }
}
