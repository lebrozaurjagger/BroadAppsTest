//
//  LoadingView.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var variation: Int
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    
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
                Image("LogoOther")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
            }
            
            VStack {
                Spacer()
                
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(CustomProgressViewStyle(variation: $variation))
                    .frame(width: 150, height: 10)
                    .onAppear(perform: startProgress)
                    .frame(width: 150, height: 10)
                    .padding(.bottom, 32)
            }
        }
    }
    
    func startProgress() {
        progress = 0.0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation {
                if progress < 1.0 {
                    progress += 0.1 / 7.0
                } else {
                    timer?.invalidate()
                }
            }
        }
    }
}

#Preview {
    LoadingView(variation: 1)
}

struct CustomProgressViewStyle: ProgressViewStyle {
    @Binding var variation: Int
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.white.opacity(variation == 1 ? 0.2 : 1))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.lightBlue)
            }
            .cornerRadius(50)
        }
    }
}
