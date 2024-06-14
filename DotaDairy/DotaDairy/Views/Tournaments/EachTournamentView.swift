//
//  EachTournamentView.swift
//  DotaDairy
//
//  Created by Phillip on 14.06.2024.
//

import SwiftUI

struct EachTournamentView: View {
    @EnvironmentObject var tournaments: Tournaments
    @State var tournament: Tournament
    
    @State private var tournamentName = ""
    @State private var location = ""
    @State private var month = ""
    @State private var year = ""
    
    @State private var prizePool = ""
    @State private var description = ""
    
    @State private var selectedMonth = 1
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    private var months: [String] {
        let formatter = DateFormatter()
        return formatter.monthSymbols
    }
    
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
                            
                            TextField("", text: $tournament.title)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Location:")
                            
                            TextField("", text: $tournament.location)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        
                        HStack {
                            Text("Date:")
                            
                            Spacer()
                            
                            Picker("Month", selection: $selectedMonth) {
                                ForEach(1..<13) { index in
                                    Text(self.months[index - 1]).tag(index)
                                }
                            }
                            
                            Picker("Year", selection: $selectedYear) {
                                ForEach((1900...2100).reversed(), id: \.self) { year in
                                    Text("\(year)").tag(year)
                                }
                            }
                        }
                        .padding(.vertical, -8)
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
                            
                            TextField("", text: $prizePool)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Description:")
                            
                            TextField("", text: $description)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                Button(action: {
//                    tournaments.editTournament(id: tournament.id,
//                                              title: tournament.title,
//                                              location: tournament.location,
//                                              description: tournament.description)
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
    }
}

#Preview {
    TournamentsView()
        .environmentObject(Tournaments())
}
