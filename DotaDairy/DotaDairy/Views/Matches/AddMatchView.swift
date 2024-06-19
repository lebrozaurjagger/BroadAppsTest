//
//  AddMatchView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct AddMatchView: View {
    @EnvironmentObject var matches: Matches
    
    @Environment(\.presentationMode) var presentationMode
    @State private var gameName = ""
    @State private var gameDate = ""
    @State private var gameTime = ""
    @State private var gameDuration = ""
    @State private var playedHero = ""
    @State private var yourKDA = ""
    
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
                        CustomTextField(text: $gameName, placeholder: "Game name", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $gameDate, placeholder: "Game date", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $gameTime, placeholder: "Game time", textColor: .white)
                            .padding(.horizontal)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 270)
                        .foregroundColor(.lightBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Game type")
                            
                            Spacer()
                            
//                            Picker("", selection: $selectedType) {
//                                ForEach(1..<3) { index in
//                                    Text(self.typeArray[index - 1]).tag(index)
//                                }
//                            }
                        }
//                        .padding(.vertical, -8)
                        .foregroundColor(.lightMoreBlue)
                        .padding(.leading)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Position")
                            
                            Spacer()
                            
//                            Picker("", selection: $selectedPosition) {
//                                ForEach(1..<3) { index in
//                                    Text(self.positionArray[index - 1]).tag(index)
//                                }
//                            }
                        }
//                        .padding(.vertical, -8)
                        .foregroundColor(.lightMoreBlue)
                        .padding(.leading)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $gameDuration, placeholder: "Game duration", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $playedHero, placeholder: "Played hero", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $yourKDA, placeholder: "Your KDA", textColor: .white)
                            .padding(.horizontal)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 108)
                        .foregroundColor(.lightBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Win")
                            
                            Spacer()
                            
                            Image(systemName: "square")
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Lose")
                            
                            Spacer()
                            
                            Image(systemName: "square")
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        matches.addMatch(gameName: gameName, 
                                         gameDate: gameDate,
                                         gameTime: gameTime,
                                         gameDuration: gameDuration,
                                         playedHero: playedHero,
                                         yourKDA: yourKDA)
                        
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
    AddMatchView()
        .environmentObject(Matches())
}
