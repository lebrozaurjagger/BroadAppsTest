//
//  StatisticsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct StatisticsView: View {
    @State private var textWins: String = ""
    @State private var textDefeats: String = ""
    @State private var textAdded: String = ""
    @State private var textEnded: String = ""
    @State private var textHero: String = ""
    @State private var textPosition: String = ""
    
    init() {
        _textWins = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_WINS") ?? "")
        _textDefeats = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_DEFEATS") ?? "")
        _textAdded = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_ADDED") ?? "")
        _textEnded = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_ENDED") ?? "")
        _textHero = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_HERO") ?? "")
        _textPosition = State(initialValue: UserDefaults.standard.string(forKey: "TEXT_POSITION") ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                ZStack {
                    ScrollView {
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textWins)
                                            .font(.system(size: 20, weight: .semibold))
                                            .onChange(of: textWins) { newValue in
                                                UserDefaults.standard.set(newValue, forKey: "TEXT_WINS")
                                            }
                                        
                                        Text("Total wins")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textDefeats)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("Total defeats")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            HStack(spacing: 16) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textAdded)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("Added tournaments")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textEnded)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("Ended tournaments")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            HStack(spacing: 16) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textHero)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("Most played hero")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 71)
                                        .foregroundColor(.lightBlue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        TextField("-----", text: $textPosition)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("Most played position")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .padding()
                        .padding(.top, 8)
                    }
                }
                .navigationTitle("Statistics")
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
    StatisticsView()
}
