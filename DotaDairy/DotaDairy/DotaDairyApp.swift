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
        Apphud.start(apiKey: "app_cpuZwEjCHy6wPe9UURFAFecknshYMe")

        OneSignal.initialize("77a78876-ec63-4f23-b5c1-106a02f88a5c", withLaunchOptions: launchOptions)
        OneSignal.login(Apphud.userID())

        let configuration = AppMetricaConfiguration(apiKey: "8e994e6a-cfc9-46ce-b73e-8cc66fb7f24e")
        AppMetrica.activate(with: configuration!)
        
        FirebaseApp.configure()
        
        return true
    }
}
