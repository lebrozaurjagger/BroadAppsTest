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
    }
}

#Preview {
    ContentView()
}
