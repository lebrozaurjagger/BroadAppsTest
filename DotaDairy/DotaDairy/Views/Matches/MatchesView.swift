//
//  MatchesView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct MatchesView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Statistics")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.vertical, 8)
                        
                        HStack(spacing: 16) {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 82)
                                    .foregroundColor(.darkBlue)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Victories")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                    
                                    Text("23")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal)
                            }
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 82)
                                    .foregroundColor(.darkBlue)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Defeats")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                    
                                    Text("12")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Matches")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .padding(.bottom, 8)
                        
                        VStack(spacing: 12) {
                            ForEach(0 ..< 2) { item in
                                NavigationLink(destination: AddMatchView()) {
                                    GameCardView()
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                NavigationLink(destination: AddMatchView()) {
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
                }
                .padding()
            }
            .navigationTitle("Matches")
        }
        .onAppear() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().backgroundColor = UIColor(.darkBlue)
            UINavigationBar.appearance().barTintColor = UIColor(.darkBlue)
            UINavigationBar.appearance().isTranslucent = false
        }
        .padding(.bottom, 48)
    }
}

#Preview {
    MatchesView()
}



struct GameCardView: View {
    var body: some View {
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
                Text("00.00.0000, 00:00")
                    .font(.system(size: 11))
                    .foregroundColor(.white.opacity(0.5))
                
                Text("Game-1")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 54, height: 20)
                            .foregroundColor(.lightMoreBlue)
                        
                        Text("Ranked")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 54, height: 20)
                            .foregroundColor(.lightMoreBlue)
                        
                        Text("70 min.")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 54, height: 20)
                            .foregroundColor(.lightMoreBlue)
                        
                        Text("12/3/24")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
