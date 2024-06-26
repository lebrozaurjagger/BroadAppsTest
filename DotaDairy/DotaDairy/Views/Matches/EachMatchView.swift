//
//  EachMatchView.swift
//  DotaDairy
//
//  Created by Phillip on 18.06.2024.
//

import SwiftUI

struct EachMatchView: View {
    @EnvironmentObject var matches: Matches
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var match: Match
    
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
                            Text("Game name:")
                            
                            TextField("", text: $match.gameName)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Game date:")
                            
                            TextField("", text: $match.gameDate)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Game time:")
                            
                            TextField("", text: $match.gameTime)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
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
                        
                        HStack {
                            Text("Game duration:")
                            
                            TextField("", text: $match.gameDuration)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Played hero:")
                            
                            TextField("", text: $match.playedHero)
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.lightMoreBlue)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.lightMoreBlue)
                        
                        HStack {
                            Text("Your KDA:")
                            
                            TextField("", text: $match.yourKDA)
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
                    matches.editMatch(id: match.id,
                                      gameName: match.gameName,
                                      gameDate: match.gameDate,
                                      gameTime: match.gameTime,
                                      gameDuration: match.gameDuration,
                                      playedHero: match.playedHero,
                                      yourKDA: match.yourKDA)
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
    MatchesView()
        .environmentObject(Matches())
}
