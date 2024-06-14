//
//  AddTournamentView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct AddTournamentView: View {
    @State private var tournamentName = ""
    @State private var location = ""
    
    @State private var selectedMonth = 1
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    private var months: [String] {
        let formatter = DateFormatter()
        return formatter.monthSymbols
    }
    
    @State private var prizePool = ""
    @State private var description = ""
    
    @EnvironmentObject var tournaments: Tournaments
    
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
                        
                        
                        HStack {
                            Text("Date")
                            
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
}
