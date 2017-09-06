//
//  AppDelegate.swift
//  NavTest
//
//  Created by AreX on 2017/6/27.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted == false {
                print("使用者未授权")
            }
        }
        center.setNotificationCategories(setCategories())
        
//        注册远程推送
//        application.registerForRemoteNotifications()

        return true
    }
    
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        print(deviceToken)
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print(error)
//    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }

    func setCategories() -> Set<UNNotificationCategory> {
        var set = Set<UNNotificationCategory>()

        let a1 = UNNotificationAction(identifier: "a1", title: "按钮1", options: [])
        let a2 = UNNotificationAction(identifier: "a2", title: "按钮2", options: [.foreground])
        let a3 = UNNotificationAction(identifier: "a3", title: "按钮3", options: [.destructive, .authenticationRequired])
        let a4 = UNTextInputNotificationAction(identifier: "a4", title: "回复", options: [])
        let c1 = UNNotificationCategory(identifier: "c1", actions: [a1, a2, a3, a4], intentIdentifiers: [], options: [])

        set.insert(c1)

        return set
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        print(response.notification.request.content.categoryIdentifier)
        print(response.actionIdentifier)

        if (response is UNTextInputNotificationResponse) {
            print((response as! UNTextInputNotificationResponse).userText)
        }
        completionHandler()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

