//
//  ContentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

enum Tab: String, Hashable, CaseIterable {
    case matches = "gamecontroller.fill"
    case tournaments = "trophy.fill"
    case statistics = "chart.xyaxis.line"
    case settings = "gearshape.fill"
}

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State private var selectedTab: Tab = Tab.matches
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    MatchesView()
                        .environmentObject(Matches())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(Tab.matches)
                    
                    TournamentsView()
                        .environmentObject(Tournaments())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(Tab.tournaments)
                    
                    StatisticsView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(Tab.statistics)
                    
                    SettingsView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(Tab.settings)
                }
                TabBar(currentTab: $selectedTab)
            }
            .ignoresSafeArea()
            
            ZStack {
                let url = URL(string: "https://www.example.com")!
                let cookies = createCookies()

                WebView(url: url, cookies: cookies)
            }
            .ignoresSafeArea()
            .opacity(1.0)
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
}

#Preview {
    ContentView()
}
