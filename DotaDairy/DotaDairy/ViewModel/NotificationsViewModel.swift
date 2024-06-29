//
//  NotificationsViewModel.swift
//  DotaDairy
//
//  Created by Phillip on 28.06.2024.
//

import SwiftUI
import UserNotifications

class NotificationsViewModel: ObservableObject {
    @Published var isNotificationGranted: Bool = false

    init() {
        checkNotificationAuthorization()
    }

    func checkNotificationAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.isNotificationGranted = settings.authorizationStatus == .authorized
            }
        }
    }
}
