//
//  AddTournamentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct AddTournamentView: View {
    @EnvironmentObject var tournaments: Tournaments
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tournamentName = ""
    @State var location = ""
    @State var date = ""
    @State var prizePool = ""
    @State var description = ""
    
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
                        CustomTextField(text: $tournamentName, placeholder: "Tournament name", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $location, placeholder: "Location", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $date, placeholder: "Date", textColor: .white)
                            .padding(.horizontal)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 108)
                        .foregroundColor(.lightBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        CustomTextField(text: $prizePool, placeholder: "Prize pool", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $description, placeholder: "Description", textColor: .white)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        tournaments.addTournament(tournamentName: tournamentName,
                                                  location: location,
                                                  date: date,
                                                  prizePool: prizePool,
                                                  description: description)
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 50)
                            .foregroundColor(.darkBlue)
                        
                        Text("Add")
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
    AddTournamentView()
        .environmentObject(Tournaments())
}
