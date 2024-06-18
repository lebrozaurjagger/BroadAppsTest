//
//  DotaDairyApp.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI
import ApphudSDK
import OneSignalFramework
import Firebase
import FirebaseRemoteConfig
import AppMetricaCore


@main
struct DotaDairyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var deviceInfoProvider = DeviceInfoProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    deviceInfoProvider.sendDeviceInfo()
                }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        Apphud.start(apiKey: "ApiKey")
//        
//        OneSignal.initialize("YOUR_ONESIGNAL_APP_ID", withLaunchOptions: launchOptions)
//        OneSignal.Notifications.requestPermission({ accepted in
//            print("User accepted notifications: \(accepted)")
//        }, fallbackToSettings: true)
//        
//        let configuration = AppMetricaConfiguration(apiKey: "API key")
//        AppMetrica.activate(with: configuration!)
//        
//        FirebaseApp.configure()
        
        return true
    }
}
