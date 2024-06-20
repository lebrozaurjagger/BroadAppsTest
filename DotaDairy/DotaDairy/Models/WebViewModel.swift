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

        let dataStore = WKWebsiteDataStore.nonPersistent()
        for cookie in cookies {
            dataStore.httpCookieStore.setCookie(cookie)
        }

        let config = WKWebViewConfiguration()
        config.websiteDataStore = dataStore

        let webViewWithCookies = WKWebView(frame: .zero, configuration: config)

        let request = URLRequest(url: url)
        webViewWithCookies.load(request)
        return webViewWithCookies
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {  }
}
