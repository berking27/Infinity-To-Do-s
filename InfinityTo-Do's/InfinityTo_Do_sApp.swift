//
//  InfinityTo_Do_sApp.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 15.08.2023.
//

import SwiftUI
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
     func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          FirebaseApp.configure()
          let db = Firestore.firestore()
          return true
     }
}


@main
struct InfinityTo_Do_sApp: App {
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
     
     var body: some Scene {
          WindowGroup {
               RootView()
                    .environmentObject(AppState.shared)
          }
     }
}
