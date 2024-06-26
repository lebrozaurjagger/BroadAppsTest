//
//  MatchesView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct MatchesView: View {
    @EnvironmentObject var eachMatch: Matches
    
    @State private var textWins: String = ""
    @State private var textDefeats: String = ""
    
    init() {
        _textWins = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_WINS") ?? "")
        _textDefeats = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_DEFEATS") ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .top) {
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
//
                                        CustomTextField(text: $textWins, placeholder: "-----", textColor: .customGreen)
                                            .foregroundColor(.customGreen)
                                            .font(.system(size: 17, weight: .semibold))
                                            .onChange(of: textWins) { newValue in
                                                UserDefaults.standard.set(newValue, forKey: "TEXT_WINS_OTHER")
                                            }
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
                                        
                                        CustomTextField(text: $textDefeats, placeholder: "-----", textColor: .customRed)
                                            .foregroundColor(.customRed)
                                            .font(.system(size: 17, weight: .semibold))
                                            .onChange(of: textDefeats) { newValue in
                                                UserDefaults.standard.set(newValue, forKey: "TEXT_DEFEATS_OTHER")
                                            }
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
                            
                            MatchesListView()
                                .padding(.top, -24)
                                .padding(.horizontal, -4)
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
            
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 1)
                .foregroundColor(.darkBlue)
        }
    }
}

#Preview {
    MatchesView()
        .environmentObject(Matches())
}
