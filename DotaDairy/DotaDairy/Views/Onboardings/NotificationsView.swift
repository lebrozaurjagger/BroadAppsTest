//
//  NotificationsView.swift
//  DotaDairy
//
//  Created by Phillip on 14.06.2024.
//

import SwiftUI
import UserNotifications

struct NotificationsView: View {
    var onClose: () -> Void
    let notificationCenter = UNUserNotificationCenter.current()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .foregroundColor(.onboardingBack)
                    .ignoresSafeArea()
                
                Button(action: {
                    onClose()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.GrayCustom.opacity(0.24))
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.lightGrayCustom.opacity(0.6))
                    }
                })
                .padding()
                
                ZStack(alignment: .bottom) {
                    
                    VStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 3)
                            .frame(width: 72, height: 6)
                            .foregroundColor(.clear)
                            .padding()
                        
                        Text("Don't miss anything")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Don't miss the most userful information")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        
                        
                        Spacer()
                        
                        ZStack {
                            Image("Notification")
                                .resizable()
                                .ignoresSafeArea()
                                .scaledToFit()
                                .frame(height: 620)
                        }
                    }
                    
                    Button(action: {
                        Task {
                            do {
                                try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
                            } catch {
                                print("Request authorization error")
                            }
                        }
                        
                        onClose()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .foregroundColor(.lightBlue)
                            
                            Text("Enable notifications")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    })
                    .padding()
                    .frame(maxWidth: 400)
                }
            }
        }
    }
}
