//
//  AddMatchView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct AddMatchView: View {
    @State private var gameName = ""
    @State private var gameDate = ""
    @State private var gameDuration = ""
    
    @State private var selectedType = 1
    @State private var selectedPosition = 1
    private var typeArray: [String] = ["11", "22"]
    private var positionArray: [String] = ["Mid Lane", "Not Mid Lane"]
    
    @State private var location = ""
    @State private var playedHero = ""
    @State private var KDA = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
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
                        
                        CustomTextField(text: $gameDuration, placeholder: "Game time", textColor: .white)
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
                            
                            Picker("", selection: $selectedType) {
                                ForEach(1..<3) { index in
                                    Text(self.typeArray[index - 1]).tag(index)
                                }
                            }
                        }
                        .padding(.vertical, -8)
                        .foregroundColor(.lightMoreBlue)
                        .padding(.leading)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Position")
                            
                            Spacer()
                            
                            Picker("", selection: $selectedPosition) {
                                ForEach(1..<3) { index in
                                    Text(self.positionArray[index - 1]).tag(index)
                                }
                            }
                        }
                        .padding(.vertical, -8)
                        .foregroundColor(.lightMoreBlue)
                        .padding(.leading)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $location, placeholder: "Location", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $playedHero, placeholder: "Played hero", textColor: .white)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        CustomTextField(text: $KDA, placeholder: "Your KDA", textColor: .white)
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
}
