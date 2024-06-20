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
import UIKit
import CoreTelephony
import SystemConfiguration.CaptiveNetwork

@main
struct DotaDairyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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
        
        
        
        let deviceInfo = collectDeviceInfo()
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: deviceInfo, options: .prettyPrinted) {
            sendData(jsonData)
        }
        
        return true
    }
    
    func collectDeviceInfo() -> [String: Any] {
        var deviceInfo: [String: Any] = [:]
        
        // vpnStatus
        let vpnStatus = isVPNConnected()
        deviceInfo["vivisWork"] = vpnStatus
        
        // deviceName
        let deviceName = UIDevice.current.name
        deviceInfo["gfdokPS"] = deviceName
        
        // deviceModel
        let deviceModel = UIDevice.current.model
        deviceInfo["gdpsjPjg"] = deviceModel
        
        // uniqueNumber (UUID)
        let uniqueNumber = UIDevice.current.identifierForVendor?.uuidString ?? ""
        deviceInfo["poguaKFP"] = uniqueNumber
        
        // wifiAddress
        let wifiAddress = getWiFiAddresses()
        deviceInfo["gpaMFOfa"] = wifiAddress
        
        // simCard
        let simCard = getCarrierName()
        deviceInfo["gciOFm"] = simCard
        
        // iosVersion
        let iosVersion = UIDevice.current.systemVersion
        deviceInfo["bcpJFs"] = iosVersion
        
        // deviceLanguage
        let deviceLanguage = Locale.preferredLanguages.first ?? ""
        deviceInfo["GOmblx"] = deviceLanguage
        
        // timeZone
        let timeZone = TimeZone.current.identifier
        deviceInfo["G0pxum"] = timeZone
        
        // isCharging
        let isCharging = UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full
        deviceInfo["Fpvbduwm"] = isCharging
        
        // storageCapacity
        let storageCapacity = getTotalDiskSpaceInBytes()
        deviceInfo["Fpbjcv"] = storageCapacity
        
        // batteryPercentage
        let batteryPercentage = Int(UIDevice.current.batteryLevel * 100)
        deviceInfo["gfpbvjsoM"] = batteryPercentage
        
        // deviceKeyboards
        let deviceKeyboards = getDeviceKeyboards()
        deviceInfo["gfdosnb"] = deviceKeyboards
        
        // region
        let region = Locale.current.regionCode ?? ""
        deviceInfo["bpPjfns"] = region
        
        // isMetricSystem
        let isMetricSystem = Locale.current.usesMetricSystem
        deviceInfo["biMpaiuf"] = isMetricSystem
        
        // isBatteryFull
        let isBatteryFull = UIDevice.current.batteryState == .full
        deviceInfo["oahgoMAOI"] = isBatteryFull
        
        return deviceInfo
    }
    
    func sendData(_ jsonData: Data) {
        // Implement your data sending logic here
        // For example, you can use URLSession to send data to your server
    }
    
    func isVPNConnected() -> Bool {
        if let settings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() as? [String: Any],
           let scopes = settings["__SCOPED__"] as? [String: Any] {
            for (key, _) in scopes {
                if key.contains("tap") || key.contains("tun") || key.contains("ppp") {
                    return true
                }
            }
        }
        return false
    }
    
    func getWiFiAddresses() -> [String] {
        var addresses: [String] = []
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceName = interface as? String,
                   let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName as CFString) as NSDictionary? {
                    if let ssid = unsafeInterfaceData[kCNNetworkInfoKeySSID as String] as? String {
                        addresses.append(ssid)
                    }
                }
            }
        }
        return addresses
    }
    
    func getCarrierName() -> String {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.serviceSubscriberCellularProviders?.first?.value
        return carrier?.carrierName ?? "Unknown"
    }
    
    func getTotalDiskSpaceInBytes() -> Int {
        if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) as [FileAttributeKey: Any],
           let totalSpace = systemAttributes[FileAttributeKey.systemSize] as? NSNumber {
            return totalSpace.intValue
        }
        return 0
    }
    
    func getDeviceKeyboards() -> [String] {
        return UITextInputMode.activeInputModes.compactMap { $0.primaryLanguage }
    }
}
