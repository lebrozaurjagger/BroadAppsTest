//
//  EachTournamentView.swift
//  DotaDairy
//
//  Created by Phillip on 14.06.2024.
//

import SwiftUI

struct EachTournamentView: View {
    @EnvironmentObject var tournaments: Tournaments
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tournament: Tournament
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Rectangle()
                    .frame(height: 28)
                    .foregroundColor(.clear)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 162)
                        .foregroundColor(.lightBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Tournament name:")
                            
                            TextField("", text: $tournament.tournamentName)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Location:")
                            
                            TextField("", text: $tournament.location)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Date:")
                            
                            TextField("", text: $tournament.date)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 108)
                        .foregroundColor(.lightBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Prize pool:")
                            
                            TextField("", text: $tournament.prizePool)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Description:")
                            
                            TextField("", text: $tournament.description)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    tournaments.editTournament(id: tournament.id,
                                               tournamentName: tournament.tournamentName, 
                                               location: tournament.location,
                                               date: tournament.date,
                                               prizePool: tournament.prizePool,
                                               description: tournament.description)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 50)
                            .foregroundColor(.darkBlue)
                        
                        Text("Save")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white.opacity(0.5))
                    }
                })
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Label("", systemImage: "square.and.pencil")
                        .foregroundColor(.red)
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Label("", systemImage: "trash.fill")
                        .foregroundColor(.red)
                })
            }
        }
    }
}

#Preview {
    TournamentsView()
        .environmentObject(Tournaments())
}
