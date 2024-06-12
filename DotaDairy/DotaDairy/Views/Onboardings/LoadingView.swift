//
//  LoadingView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var variation = 1
    
    var body: some View {
        ZStack {
            Image("onboardingBackground")
                .resizable()
                .scaledToFill()
                .offset(x: -70)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black.opacity(0.3), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(.onboardingBack)
                .opacity(variation == 1 ? 0 : 1)
                .ignoresSafeArea()
            
            if variation == 1 {
                Image("IconDairy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
            } else {
                Image("IconDota")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
            }
            
            VStack {
                Spacer()
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 150, height: 10)
                        .foregroundColor(.white.opacity(variation == 1 ? 0.2 : 1))
                    
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 90, height: 10)
                        .foregroundColor(.lightBlue)
                }
                .frame(width: 150, height: 10)
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    LoadingView()
}
