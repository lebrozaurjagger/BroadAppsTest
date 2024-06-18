//
//  ContentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfig

struct ContentView: View {
    @State private var showLoadingView = true
    @State private var navigateToWebView = false
    @State private var lastDate: Date?
    @State private var isDead = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            if showLoadingView {
                LoadingView()
                    .onAppear {
                        fetchRemoteConfigValues()
                    }
            } else if navigateToWebView {
                ZStack {
                    let url = URL(string: "https://www.example.com")!
                    let cookies = createCookies()

                    WebView(url: url, cookies: cookies)
                }
                .ignoresSafeArea()
            }
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
    
    func fetchRemoteConfigValues() {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetchAndActivate { status, error in
            if error == nil {
                if let lastDateString = remoteConfig["lastDate"].stringValue {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    self.lastDate = dateFormatter.date(from: lastDateString)
                }
                self.isDead = remoteConfig["isDead"].boolValue
                self.checkDatesAndMakeRequest()
            }
        }
    }
    
    func checkDatesAndMakeRequest() {
        guard let lastDate = lastDate else {
            return
        }
        
        let currentDate = Date()
        if currentDate < lastDate {
            self.showLoadingView = false
        } else {
            makeServerRequest()
        }
    }
    
    func makeServerRequest() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: false) { _ in
            self.handleTimeout()
        }
        
        // Simulate a server request
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { // Simulating server response in 3 seconds
            let serverResponse = true // This would be the actual server response
            
            DispatchQueue.main.async {
                self.timer?.invalidate()
                self.timer = nil
                self.showLoadingView = false
                
                if serverResponse {
                    
                } else {
                    self.navigateToWebView = true
                }
            }
        }
    }
    
    func handleTimeout() {
        self.showLoadingView = false
        if isDead {
            self.navigateToWebView = true
        }
    }
}

#Preview {
    ContentView()
}
