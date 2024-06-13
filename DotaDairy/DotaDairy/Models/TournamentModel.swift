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
    private let USER_KEY = "A"
    
    let date = Date()
    var tournaments: [Tournament] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: USER_KEY) {
            if let decodedTournaments = try? JSONDecoder().decode([Tournament].self, from: data) {
                tournaments = decodedTournaments
                return
            }
        }
        tournaments = [Tournament(title: "TitleTemp", description: "DescriptionTemp", date: "May 2024")]
    }
    
    func addTournament(title: String, description: String) {
        let temporaryTournament = Tournament(title: "", description: "", date: "")
        tournaments.insert(temporaryTournament, at: 0)
        saveData()
    }
    
    private func saveData() {
        if let encodedTournaments = try? JSONEncoder().encode(tournaments) {
            UserDefaults.standard.set(encodedTournaments, forKey: USER_KEY)
        }
    }
    
    func deletAll() {
        UserDefaults.standard.removeObject(forKey: USER_KEY)
        UserDefaults.resetStandardUserDefaults()
        tournaments = []
    }
    
    func editTournament(id: UUID, title: String, description: String, date: String) {
        if let editingNote = tournaments.first(where: { $0.id == id }) {
            let index = tournaments.firstIndex(of: editingNote)
            tournaments[index!].title = title
            tournaments[index!].description = description
            tournaments[index!].date = date
        }
    }
}
