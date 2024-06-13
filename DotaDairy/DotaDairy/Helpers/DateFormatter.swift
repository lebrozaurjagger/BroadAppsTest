//
//  DateFormatter.swift
//  DotaDairy
//
//  Created by Phillip on 13.06.2024.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
