//
//  appPilotoApp.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/23/24.
//

import SwiftUI
import FirebaseCore
import TipKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct appPilotoApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  init() {
     try? Tips.configure()
   }
  
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
