//
//  StatisticsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct StatisticsView: View {
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
                                        Text("23")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.customGreen)
                                        
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
                                        Text("12")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.customRed)
                                        
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
                                        Text("92")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                        
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
                                        Text("10")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                        
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
                                        Text("Arc Warden")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                        
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
                                        Text("Mid lane")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                        
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
}

#Preview {
    StatisticsView()
}
