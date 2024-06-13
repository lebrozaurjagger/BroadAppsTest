//
//  MatchesModel.swift
//  DotaDairy
//
//  Created by Phillip on 13.06.2024.
//

import Foundation
import SwiftUI

struct Match : Hashable, Codable, Identifiable {
    var id = UUID()
    var dateTime: String
    var title: String
    var type: String
    var timeMatch: String
    var KDA: String
}

@MainActor class Matches : ObservableObject {
    private let USER_KEY = "A"
    
    let date = Date()
    var matches: [Match] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: USER_KEY) {
            if let decodedMatches = try? JSONDecoder().decode([Match].self, from: data) {
                matches = decodedMatches
                return
            }
        }
        matches = [Match(dateTime: "23.12.0000", title: "Temp-1", type: "RanKed", timeMatch: "33", KDA: "2/3/4")]
    }
    
    func addMatch(title: String, description: String) {
        let temporaryMatch = Match(dateTime: "", title: "", type: "", timeMatch: "", KDA: "")
        matches.insert(temporaryMatch, at: 0)
        saveData()
    }
    
    private func saveData() {
        if let encodedMatch = try? JSONEncoder().encode(matches) {
            UserDefaults.standard.set(encodedMatch, forKey: USER_KEY)
        }
    }
    
    func deletAll() {
        UserDefaults.standard.removeObject(forKey: USER_KEY)
        UserDefaults.resetStandardUserDefaults()
        matches = []
    }
    
    func editTournament(id: UUID, dateTime: String, title: String, type: String, timeMatch: String, KDA: String) {
        if let editingNote = matches.first(where: { $0.id == id }) {
            let index = matches.firstIndex(of: editingNote)
            matches[index!].dateTime = dateTime
            matches[index!].title = title
            matches[index!].type = type
            matches[index!].timeMatch = timeMatch
            matches[index!].KDA = KDA
        }
    }
}
