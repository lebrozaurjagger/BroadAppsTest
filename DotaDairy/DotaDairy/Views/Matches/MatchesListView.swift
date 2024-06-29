//
//  MatchesListView.swift
//  DotaDairy
//
//  Created by Phillip on 27.06.2024.
//

import SwiftUI

struct MatchesListView: View {
    @EnvironmentObject var eachMatch: Matches
    
    var body: some View {
        NavigationView {
            List {
                ForEach(eachMatch.matches) { match in
                    NavigationLink(destination: EachMatchView(match: match)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 103)
                                .foregroundColor(.lightBlue)
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 28, height: 33)
                                        .foregroundColor(.customGreen)
                                    
                                    Text("W")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.customGreenDark)
                                }
                                
                                Spacer()
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 28, height: 33)
                                        .foregroundColor(.customRed)
                                    
                                    Text("L")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.customRedDark)
                                }
                            }
                            .padding()
                            
                            VStack {
                                Text(match.gameDate)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Text(match.gameName)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .frame(width: 54, height: 20)
                                            .foregroundColor(.lightMoreBlue)
                                        
                                        Text("temp")/*(match.gameType)*/
                                            .font(.system(size: 11))
                                            .foregroundColor(.white)
                                    }
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .frame(width: 54, height: 20)
                                            .foregroundColor(.lightMoreBlue)
                                        
                                        Text("\(match.gameTime) min.")
                                            .font(.system(size: 11))
                                            .foregroundColor(.white)
                                    }
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .frame(width: 54, height: 20)
                                            .foregroundColor(.lightMoreBlue)
                                        
                                        Text(match.yourKDA)
                                            .font(.system(size: 11))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .padding(.trailing)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                    }
                }
                .onDelete(perform: deleteMatch)
                .padding(.trailing, -38)
            }
            .listStyle(.plain)
        }
    }
    
    func deleteMatch(at offsets: IndexSet) {
        eachMatch.matches.remove(atOffsets: offsets)
    }
}

#Preview {
    MatchesListView()
        .environmentObject(Matches())
}
