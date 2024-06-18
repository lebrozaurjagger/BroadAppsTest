//
//  SettingsView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI
import StoreKit
import UIKit

struct SettingsView: View {
    @StateObject var matches = Matches()
    
    @State private var confirmButton = false
    @State private var isShareSheetPresented = false
    
    @AppStorage("launchCount") private var launchCount: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 168)
                                .foregroundColor(.lightBlue)
                            
                            VStack(spacing: 16) {
                                Button(action: {
                                    
                                }, label: {
                                    ListButton(title: "Usage Policy", icon: "doc.text.fill")
                                })
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.lightMoreBlue)
                                    .padding(.leading, 64)
                                
                                Button(action: {
                                    isShareSheetPresented = true
                                }, label: {
                                    ListButton(title: "Share App", icon: "square.and.arrow.up.fill")
                                })
                                .sheet(isPresented: $isShareSheetPresented) {
                                    ShareSheet(activityItems: ["Check out this cool SwiftUI tutorial!"])
                                }
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.lightMoreBlue)
                                    .padding(.leading, 64)
                                
                                Button(action: {
                                    requestReview()
                                }, label: {
                                    ListButton(title: "Rate Us", icon: "star.fill")
                                })
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                matches.deleteAll()
                            }
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
                        .padding()
                    }
                    .padding(.top, 8)
                }
                .navigationTitle("Settings")
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
        .onAppear {
            incrementLaunchCount()
        }
    }
    
    func incrementLaunchCount() {
        launchCount += 1
        if launchCount == 5 {
            requestReview()
        }
    }
    
    func requestReview() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}

#Preview {
    SettingsView()
}

struct ListButton: View {
    @State var title: String
    @State var icon: String
    
    var body: some View {
        HStack {
            Label(title, systemImage: icon)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .foregroundColor(.white)
        .font(.system(size: 17, weight: .semibold))
        .padding(.horizontal)
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
