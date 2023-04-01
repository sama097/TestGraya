//
//  AppDelegate.swift
//  Test
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation
import SwiftUI
import UIKit
import Firebase
class AppDelegate: UIResponder, UIApplicationDelegate {
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
   
    FirebaseApp.configure()

    return true
}

func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
   return true
}
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> Bool {
     
        return true
    }
    


}
