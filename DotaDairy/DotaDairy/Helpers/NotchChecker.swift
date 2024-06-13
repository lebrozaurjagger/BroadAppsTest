//
//  NotchChecker.swift
//  DotaDairy
//
//  Created by Phillip on 13.06.2024.
//

import Foundation
import SwiftUI

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            guard let window = windowScene?.windows.first else { return false }
            
            return window.safeAreaInsets.top > 20
        }
        
        if #available(iOS 11.0, *) {
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20
        } else {
            return false
        }
    }
}
