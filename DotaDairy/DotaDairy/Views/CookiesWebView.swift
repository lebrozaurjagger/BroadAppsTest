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

struct CookiesWebView: View {
    @ObservedObject var viewModel = RemoteConfigViewModel()
    
    var body: some View {
        if let url = viewModel.url {
            WebView(url: url)
        } else {
            Text("Loading...")
                .onAppear {
                    self.viewModel.fetchRemoteConfig()
                }
        }
    }
}

#Preview {
    CookiesWebView()
}
