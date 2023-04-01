//
//  TestApp.swift
//  Test
//
//  Created by TeamX Tec on 31/03/2023.
//

import SwiftUI
import UIKit
import SwiftUI
@main
struct TestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
