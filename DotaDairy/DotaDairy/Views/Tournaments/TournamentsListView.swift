//
//  TournamentsListView.swift
//  DotaDairy
//
//  Created by Phillip on 27.06.2024.
//

import SwiftUI

struct TournamentsListView: View {
    @EnvironmentObject var eachTournament: Tournaments
    
    var body: some View {
        NavigationView {
            List {
                ForEach(eachTournament.tournaments) { tournament in
                    NavigationLink(destination: EachTournamentView(tournament: tournament)) {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 103)
                                .foregroundColor(.lightBlue)
                            
                            VStack(alignment: .leading) {
                                Text(tournament.date)
                                    .lineLimit(1)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Text(tournament.tournamentName)
                                    .lineLimit(1)
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text(tournament.description)
                                    .lineLimit(1)
                                    .font(.system(size: 15))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .lineLimit(1)
                            .padding(.trailing, 40)
                            .padding(.horizontal)
                        }
                        .padding(.trailing)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                    }
                }
                .onDelete(perform: deleteTournament)
                .padding(.trailing, -38)
            }
            .listStyle(.plain)
        }
    }
    
    func deleteTournament(at offsets: IndexSet) {
        eachTournament.tournaments.remove(atOffsets: offsets)
    }
}

#Preview {
    TournamentsListView()
        .environmentObject(Tournaments())
}
