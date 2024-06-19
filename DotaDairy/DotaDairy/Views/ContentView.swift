//
//  ContentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfig
import WebKit

struct ContentView: View {
    @State private var navigateToHome: Bool?
    @State private var remoteConfigDate: Date = Date()
    @State private var isDead: Bool = false
    
    var body: some View {
        if let navigateToHome = navigateToHome {
            if navigateToHome {
                HomeView()
            } else {
                WebView(url: URL(string: "https://www.example.com")!, cookies: createCookies())
                    .ignoresSafeArea()
            }
        } else {
            LoadingView()
                .onAppear()
        }
    }
    
    func createCookies() -> [HTTPCookie] {
        var cookies = [HTTPCookie]()
        
        if let cookie = HTTPCookie(properties: [
            .domain: "example.com",
            .path: "/",
            .name: "exampleCookie",
            .value: "exampleValue",
            .secure: "TRUE",
            .expires: NSDate(timeIntervalSinceNow: 31556926)
        ]) {
            cookies.append(cookie)
        }
        
        return cookies
    }
    
    func saveCookies(_ cookies: [HTTPCookie]) {
        let cookieStorage = HTTPCookieStorage.shared
        for cookie in cookies {
            cookieStorage.setCookie(cookie)
        }
    }
    
    func fetchRemoteConfigDate(completion: @escaping (Bool) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetch { status, error in
            if status == .success {
                remoteConfig.activate { _, _ in
                    if let dateString = remoteConfig["lastDate"].stringValue,
                       let date = ISO8601DateFormatter().date(from: dateString) {
                        self.remoteConfigDate = date
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    func makeServerRequest(completion: @escaping (Bool) -> Void) {
        // Implement your server request logic here and call completion with true or false
        // For now, we simulate a server request
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            completion(true) // Simulate server response
        }
    }
    
    func startCountdownAndRequest() {
        let dispatchGroup = DispatchGroup()
        var serverResponse: Bool? = nil
        
        dispatchGroup.enter()
        // Make server request here (pseudo-code)
        makeServerRequest { response in
            serverResponse = response
            dispatchGroup.leave()
        }
        
        // Start countdown
        DispatchQueue.global().asyncAfter(deadline: .now() + 7) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let serverResponse = serverResponse {
                self.navigateToHome = serverResponse
            } else {
                // Fetch `isDead` from Remote Config
                let remoteConfig = RemoteConfig.remoteConfig()
                if remoteConfig["isDead"].boolValue {
                    self.navigateToHome = false
                } else {
                    self.navigateToHome = true
                }
            }
        }
    }
    
    func checkDateAndFetch() {
        // Fetch remote config date
        fetchRemoteConfigDate { success in
            guard success else {
                // Handle error
                return
            }
            
            // Calculate date difference
            let currentDate = Date()
            let deferredDate = Calendar.current.date(byAdding: .day, value: 3, to: remoteConfigDate)!
            
            if currentDate < deferredDate {
                // Date is within 2-3 days, no server request, navigate immediately
                self.navigateToHome = true
            } else {
                // Date is past 2-3 days, make server request and start countdown
                startCountdownAndRequest()
            }
        }
    }
}

#Preview {
    ContentView()
}
