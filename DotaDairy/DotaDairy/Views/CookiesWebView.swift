//
//  CookiesWebView.swift
//  DotaDairy
//
//  Created by Phillip on 24.06.2024.
//

import SwiftUI
import WebKit
import Firebase
import FirebaseRemoteConfig
import UserNotifications

struct CookiesWebView: View {
    @ObservedObject var viewModel = RemoteConfigViewModel()
    @State private var showSheet = false
    
    var body: some View {
        if let url = viewModel.url {
            ZStack {
                WebView(url: url)
                    .onAppear {
                        self.checkNotificationPermissions()
                    }
                    .sheet(isPresented: $showSheet) {
                        NotificationsView(onClose: {
                            self.showSheet = false
                        })
                    }
            }
        } else {
            Text("Loading...")
                .onAppear {
                    self.viewModel.fetchRemoteConfig()
                }
        }
    }
    
    private func checkNotificationPermissions() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus != .authorized {
                DispatchQueue.main.async {
                    self.showSheet = true
                }
            }
        }
    }
}

#Preview {
    CookiesWebView()
}
