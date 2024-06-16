//
//  WebViewModel.swift
//  DotaDairy
//
//  Created by Phillip on 16.06.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    let cookies: [HTTPCookie]

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        // Setting cookies
        let dataStore = WKWebsiteDataStore.nonPersistent()
        for cookie in cookies {
            dataStore.httpCookieStore.setCookie(cookie)
        }

        // Configure the WebView with the data store containing cookies
        let config = WKWebViewConfiguration()
        config.websiteDataStore = dataStore

        // Creating the WebView with the configuration
        let webViewWithCookies = WKWebView(frame: .zero, configuration: config)

        // Load the URL request
        let request = URLRequest(url: url)
        webViewWithCookies.load(request)
        return webViewWithCookies
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Handle updates to the UIViewRepresentable
    }
}
