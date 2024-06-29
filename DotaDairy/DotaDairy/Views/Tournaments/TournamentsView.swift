//
//  TournamentsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct TournamentsView: View {
    @EnvironmentObject var eachTournament: Tournaments
    
    @State private var isTapped = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    ScrollView {
                        TournamentsListView()
                            .padding(.vertical, 24)
                    }
                    
                    NavigationLink(destination: AddTournamentView()) {
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
                    .onDisappear {
                        isTapped = true
                    }
                    .onAppear {
                        isTapped = false
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
            
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 1)
                    .foregroundColor(.darkBlue)
                
                Text("Add tournament")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .opacity(isTapped ? 1.0 : 0.0)
            }
        }
    }
}

#Preview {
    TournamentsView()
        .environmentObject(Tournaments())
}
