//
//  ContentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MatchesView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                }
            
            TournamentsView()
                .tabItem {
                    Image(systemName: "trophy.fill")
                }
            
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
        .ignoresSafeArea()
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(.darkBlue)
            UITabBar.appearance().backgroundColor = UIColor(.darkBlue)
        }
    }
}

#Preview {
    ContentView()
}
