//
//  TournamentModel.swift
//  DotaDairy
//
//  Created by Phillip on 12.06.2024.
//

import Foundation
import SwiftUI

struct Tournament : Hashable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var date: String
}

@MainActor class Tournaments : ObservableObject {
    private let TOURNAMENT_KEY = "A"
    
    let date = Date()
    var tournaments: [Tournament] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: TOURNAMENT_KEY) {
            if let decodedMatches = try? JSONDecoder().decode([Tournament].self, from: data) {
                tournaments = decodedMatches
                return
            }
        }
        tournaments = []
    }
    
    func addMatch(title: String, description: String) {
        let temporaryMatch = Tournament(title: "", description: "", date: "")
        tournaments.insert(temporaryMatch, at: 0)
        saveData()
    }
    
    private func saveData() {
        if let encodedNotes = try? JSONEncoder().encode(tournaments) {
            UserDefaults.standard.set(encodedNotes, forKey: TOURNAMENT_KEY)
        }
    }
    
    func deletAll() {
        UserDefaults.standard.removeObject(forKey: TOURNAMENT_KEY)
        UserDefaults.resetStandardUserDefaults()
        tournaments = []
    }
    
    func editMatch(id: UUID, title: String, description: String, date: String) {
        if let editingNote = tournaments.first(where: { $0.id == id }) {
            let index = tournaments.firstIndex(of: editingNote)
            tournaments[index!].title = title
            tournaments[index!].description = description
            tournaments[index!].date = date
        }
    }
}



extension Date {
    func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
