//
//  SettingsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 1)
                        .foregroundColor(.darkBlue)
                    
                    Spacer()
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 168)
                            .foregroundColor(.lightBlue)
                        
                        VStack(spacing: 16) {
                            HStack {
                                Label("Usage Policy", systemImage: "doc.text.fill")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.horizontal)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.lightMoreBlue)
                                .padding(.leading, 64)
                            
                            HStack {
                                Label("Share App", systemImage: "square.and.arrow.up.fill")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.horizontal)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.lightMoreBlue)
                                .padding(.leading, 64)
                            
                            HStack {
                                Label("Rate Us", systemImage: "star.fill")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .foregroundColor(.lightBlue)
                            
                            Text("Reset Progress")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    })
                }
                .padding()
                .padding(.top, 8)
            }
            .navigationBarTitle("Settings")
        }
        .onAppear() {
            UINavigationBar.appearance().backgroundColor = UIColor(.darkBlue)
            UINavigationBar.appearance().barTintColor = UIColor(.darkBlue)
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}

#Preview {
    SettingsView()
}
