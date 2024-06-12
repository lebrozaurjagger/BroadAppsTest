//
//  TournamentsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct TournamentsView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 1)
                        .foregroundColor(.darkBlue)
                    
                    Spacer()
                }
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(0 ..< 9) { item in
                            TournamentCard()
                        }
                    }
                    .padding(.vertical, 24)
                }
                
                NavigationLink(destination: AddMatchView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.lightBlue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.darkBlue, lineWidth: 3)
                            )
                        
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .navigationTitle("Tournaments")
        }
        .onAppear() {
            UINavigationBar.appearance().backgroundColor = UIColor(.darkBlue)
            UINavigationBar.appearance().barTintColor = UIColor(.darkBlue)
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}

#Preview {
    TournamentsView()
}

struct TournamentCard: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 102)
                .foregroundColor(.lightBlue)
            
            VStack(alignment: .leading) {
                Text("May 2024")
                    .font(.system(size: 11))
                    .foregroundColor(.white.opacity(0.5))
                
                Text("ESL One Birmingham")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("A premier Dota 2 tournament organized by somebody END")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.7))
            }
            .lineLimit(1)
            .padding(.trailing, 40)
            .padding(.horizontal)
            
            HStack {
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}
