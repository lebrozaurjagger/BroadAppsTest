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
    var tournamentName: String
    var location: String
    var date: String
    var prizePool: String
    var description: String
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
            if let decodedTournament = try? JSONDecoder().decode([Tournament].self, from: data) {
                tournaments = decodedTournament
                return
            }
        }
        tournaments = [Tournament(tournamentName: "Temp", location: "Temp", date: "Temp", prizePool: "Temp", description: "Temp")]
    }
    
    func addTournament(tournamentName: String, location: String, date: String, prizePool: String, description: String) {
        let temporaryTournament = Tournament(tournamentName: tournamentName, location: location, date: date, prizePool: prizePool, description: description)
        tournaments.insert(temporaryTournament, at: 0)
        saveData()
    }
    
    private func saveData() {
        if let encodedTournament = try? JSONEncoder().encode(tournaments) {
            UserDefaults.standard.set(encodedTournament, forKey: USER_KEY)
        }
    }
    
    func editTournament(id: UUID, tournamentName: String, location: String, date: String, prizePool: String, description: String) {
        if let editingTournament = tournaments.first(where: { $0.id == id }) {
            let index = tournaments.firstIndex(of: editingTournament)
            tournaments[index!].tournamentName = tournamentName
            tournaments[index!].location = location
            tournaments[index!].date = date
            tournaments[index!].prizePool = prizePool
            tournaments[index!].description = description
        }
    }
}
