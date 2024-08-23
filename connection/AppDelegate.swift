//
//  AppDelegate.swift
//  connection
//
//  Created by 椎葉友渚 on 2024/08/23.
//

import UIKit
import MultipeerConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid

    func applicationDidEnterBackground(_ application: UIApplication) {
        startBackgroundTask()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        endBackgroundTask()
    }
    
    private func startBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.endBackgroundTask()
        })
        
        // Perform background work here (this may include setting up communication or data transfer)
        // Note: Network requests might still be handled by the frameworks like MultipeerConnectivity itself
    }
    
    private func endBackgroundTask() {
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = .invalid
    }
}

