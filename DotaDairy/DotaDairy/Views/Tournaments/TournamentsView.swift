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
                ScrollView {
                    ZStack(alignment: .bottomLeading) {
                        Rectangle()
                            .foregroundColor(.darkBlue)
                            .frame(height: 150)
                        
                        Text("Tournaments")
                            .foregroundColor(.white)
                            .padding()
                            .font(.system(size: 34, weight: .bold))
                    }
                    
                    VStack(spacing: 12) {
                        ForEach(0 ..< 9) { item in
                            NavigationLink(destination: AddTournamentView()) {
                                TournamentCard()
                            }
                        }
                    }
                    .padding(.vertical, 24)
                }
                .ignoresSafeArea()
                
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
                    .padding()
                }
            }
            .background(
                VStack {
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(.darkBlue)
                    
                    Spacer()
                }
            )
            .ignoresSafeArea()
        }
        .padding(.bottom, 48)
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
