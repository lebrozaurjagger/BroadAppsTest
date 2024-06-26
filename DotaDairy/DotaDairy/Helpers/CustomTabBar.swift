//
//  TabBar.swift
//  DotaDairy
//
//  Created by Phillip on 13.06.2024.
//

import SwiftUI

private let buttonDimen: CGFloat = 55

struct TabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack {
            TabBarButton(imageName: Tab.matches.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .matches
                }
            
            Spacer()

            TabBarButton(imageName: Tab.tournaments.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .tournaments
                }

            Spacer()
            
            TabBarButton(imageName: Tab.statistics.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .statistics
                }

            Spacer()
            
            TabBarButton(imageName: Tab.settings.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .settings
                }
        }
        .frame(height: 32)
        .padding(.horizontal, 17)
        .padding(.top)
        .padding(.bottom, 34)
        .background(Color.darkBlue)
    }
}

private struct TabBarButton: View {
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 24)
            .foregroundColor(.gray)
    }
}
