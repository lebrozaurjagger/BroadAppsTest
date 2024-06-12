//
//  UserOnboardingView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct UserOnboardingView: View {
    @State var counter: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.onboardingBack)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                HStack {
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 72, height: 6)
                        .foregroundColor(.onboardingBlue)
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 72, height: 6)
                        .foregroundColor(counter == 1 ? .onboardingBlue : .white.opacity(0.27))
                }
                .padding()
                
                if counter == 0 {
                    Text("Buy and take profit")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                } else {
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                }
                
                if counter == 0 {
                    Text("Earn money for your dreams")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 15))
                } else {
                    Text("Help make the app even better")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 15))
                }
                
                
                Spacer()
                
                ZStack {
                    if counter == 0 {
                        Image("MatchesPhone")
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFit()
                            .frame(height: 620)
                    } else {
                        Image("Rates")
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFit()
                            .frame(height: 620)
                    }
                }
            }
            
            Button(action: {
                withAnimation {
                    counter += 1
                    
                    if counter == 2 {
                        counter = 0
                    }
                    
                    print("DEBUG: Onboarding counter is - \(counter)")
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 50)
                        .foregroundColor(.lightBlue)
                    
                    Text("Next")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
            })
            .padding()
            .frame(maxWidth: 400)
        }
    }
}

#Preview {
    UserOnboardingView()
}
