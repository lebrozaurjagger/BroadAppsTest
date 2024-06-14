//
//  TournamentsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct TournamentsView: View {
    @EnvironmentObject var eachTournament: Tournaments
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(eachTournament.tournaments) { tournament in
                                NavigationLink(destination: EachTournamentView(tournament: tournament)) {
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 102)
                                            .foregroundColor(.lightBlue)
                                        
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(tournament.month)
                                                    .font(.system(size: 11))
                                                    .foregroundColor(.white.opacity(0.5))
                                                
                                                Text(tournament.year)
                                                    .font(.system(size: 11))
                                                    .foregroundColor(.white.opacity(0.5))
                                            }
                                            
                                            Text(tournament.title)
                                                .font(.system(size: 17, weight: .semibold))
                                                .foregroundColor(.white)
                                            
                                            Text(tournament.description)
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
                        .padding()
                    }
                }
                .navigationTitle("Tournaments")
            }
            .onAppear() {
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
                UINavigationBar.appearance().backgroundColor = UIColor(.darkBlue)
                UINavigationBar.appearance().barTintColor = UIColor(.darkBlue)
                UINavigationBar.appearance().isTranslucent = false
            }
            .padding(.bottom, 48)
            
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 1)
                .foregroundColor(.darkBlue)
        }
    }
}

#Preview {
    TournamentsView()
        .environmentObject(Tournaments())
}
