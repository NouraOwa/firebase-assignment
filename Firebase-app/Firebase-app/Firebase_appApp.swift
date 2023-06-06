//
//  Firebase_appApp.swift
//  Firebase-app
//
//  Created by Noura Alowayid on 16/11/1444 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main

struct Firebase_appApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        var isNewUser = true
        WindowGroup {
            NavigationView{
                if isNewUser == true {
                    CreateAccount(pass: "Password")
                }
                else{
                    SignIn()
                }
            }
        }
    }
}
