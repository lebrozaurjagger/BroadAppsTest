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
                                                autosave(field: "textWins", value: newValue)
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
                                            .onChange(of: textDefeats) { newValue in
                                                autosave(field: "textDefeats", value: newValue)
                                            }
                                        
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
                                            .onChange(of: textAdded) { newValue in
                                                autosave(field: "textAdded", value: newValue)
                                            }
                                        
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
                                            .onChange(of: textEnded) { newValue in
                                                autosave(field: "textEnded", value: newValue)
                                            }
                                        
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
                                            .onChange(of: textHero) { newValue in
                                                autosave(field: "textHero", value: newValue)
                                            }
                                        
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
                                            .onChange(of: textPosition) { newValue in
                                                autosave(field: "textPosition", value: newValue)
                                            }
                                        
                                        Text("Most played position")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .padding()
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
    
    func autosave(field: String, value: String) {
        // Perform your save operation here, e.g., send data to the server or save locally
        print("Autosaving \(field): \(value)")
        // Example: Save to UserDefaults
        UserDefaults.standard.set(value, forKey: field)
    }
}

#Preview {
    StatisticsView()
}
