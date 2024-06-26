//
//  ContentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI
import Combine
import Firebase
import FirebaseRemoteConfig
import WebKit

struct ContentView: View {
    @StateObject private var remoteConfigManager = RemoteConfigViewModel()
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    @State private var ONE_0 = 0 
    @State private var isLoading = false
    @State private var requestFailed = false
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    var body: some View {
        VStack {
            if ONE_0 == 1 {
                if isLoading {
                    if onboardingViewModel.hasCompletedOnboarding {
                        HomeView()
                    } else {
                        ReviewerOnboardingView(onboardingViewModel: onboardingViewModel)
                    }
                } else {
                    LoadingView(variation: 1)
                }
            } else if ONE_0 == 0 {
                if isLoading {
                    if onboardingViewModel.hasCompletedOnboarding {
                        CookiesWebView()
                    } else {
                        UserOnboardingView(onboardingViewModel: onboardingViewModel)
                    }
                } else {
                    LoadingView(variation: 0)
                }
            }
        }
        .onAppear {
            remoteConfigManager.fetchRemoteConfig()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                withAnimation {
                    self.isLoading = true
                }
            }
        }
    }
    
    private func fetchRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600 // Fetch interval in seconds
        remoteConfig.configSettings = settings
        
        remoteConfig.fetchAndActivate { status, error in
            if status == .successFetchedFromRemote || status == .successUsingPreFetchedData {
                let lastDateString = self.remoteConfig["lastDate"].stringValue ?? ""
                self.checkDate(lastDateString: lastDateString)
            } else {
                print("Error fetching remote config: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
    private func checkDate(lastDateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        guard let lastDate = dateFormatter.date(from: lastDateString) else {
            print("Error: Unable to parse date")
            return
        }
        
        let currentDate = Date()
        let threeDaysInSeconds: TimeInterval = 3 * 24 * 60 * 60
        
        if currentDate.timeIntervalSince(lastDate) <= threeDaysInSeconds {
            ONE_0 = 1
        } else {
            serverRequest()
        }
    }
    
    func serverRequest() {
        let timeout = DispatchTime.now() + 7
        
        DispatchQueue.global().asyncAfter(deadline: timeout) {
            if !requestFailed {
                DispatchQueue.main.async {
                    checkIsDead()
                }
            }
        }
        
        NetworkManager.shared.fetchResponse { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.ONE_0 = response.past ? 1 : 0
                    self.requestFailed = true
                case .failure:
                    self.checkIsDead()
                }
            }
        }
    }
    
    private func checkIsDead() {
        ONE_0 = remoteConfigManager.isDead ? 0 : 1
    }
}

struct ServerResponse: Decodable {
    let result: Bool
}

#Preview {
    ContentView()
}
