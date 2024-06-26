//
//  ReviewerOnboardingView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct ReviewerOnboardingView: View {
    @ObservedObject var onboardingViewModel: OnboardingViewModel
    
    @State var counter: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("onboardingBackground")
                .resizable()
                .scaledToFill()
                .offset(x: -70)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black.opacity(0.3), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                HStack {
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 72, height: 6)
                        .foregroundColor(.onboardingBlue)
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 72, height: 6)
                        .foregroundColor(counter == 1 || counter == 2 ? .onboardingBlue : .white.opacity(0.27))
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 72, height: 6)
                        .foregroundColor(counter == 2 ? .onboardingBlue : .white.opacity(0.27))
                }
                .padding()
                
                if counter == 0 {
                    Text("Manage your team!")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                } else if counter == 1 {
                    Text("Explore your own inventory")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                } else {
                    Text("Be in focus with games")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                }
                
                if counter == 0 {
                    Text("Be your own trainer!")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 15))
                } else if counter == 1 {
                    Text("Awesome function")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 15))
                } else {
                    Text("Fill out the game calendar!")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 15))
                }
                
                
                Spacer()
                
                ZStack {
                    if counter == 1 {
                        Image("TournamentsPhone")
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFit()
                            .frame(height: 620)
                    } else if counter == 2 {
                        Image("StatisticsPhone")
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFit()
                            .frame(height: 620)
                    } else {
                        Image("MatchesPhone")
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
                    
                    if counter == 3 {
                        counter = 0
                        onboardingViewModel.hasCompletedOnboarding = true
                    }
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
