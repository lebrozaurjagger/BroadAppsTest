//
//  OnboardingViewModel.swift
//  DotaDairy
//
//  Created by Phillip on 27.06.2024.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    private var universalKey = "1234"
    
    @Published var hasCompletedOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(hasCompletedOnboarding, forKey: universalKey)
        }
    }
    
    init() {
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: universalKey)
    }
}
