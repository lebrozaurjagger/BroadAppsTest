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
    var gameName: String
    var gameDate: String
    var gameTime: String
    var gameDuration: String
    var playedHero: String
    var yourKDA: String
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
        matches = [Match(gameName: "Temp", gameDate: "Temp", gameTime: "Temp", gameDuration: "Temp", playedHero: "Temp", yourKDA: "Temp")]
    }
    
    func addMatch(gameName: String, gameDate: String, gameTime: String, gameDuration: String, playedHero: String, yourKDA: String) {
        let temporaryMatch = Match(gameName: gameName, gameDate: gameDate, gameTime: gameTime, gameDuration: gameDuration, playedHero: playedHero, yourKDA: yourKDA)
        matches.insert(temporaryMatch, at: 0)
        saveData()
    }
    
    private func saveData() {
        if let encodedMatch = try? JSONEncoder().encode(matches) {
            UserDefaults.standard.set(encodedMatch, forKey: USER_KEY)
        }
    }
    
    func deleteAll() {
        UserDefaults.standard.removeObject(forKey: USER_KEY)
        UserDefaults.resetStandardUserDefaults()
        matches = []
    }
    
    func editMatch(id: UUID, gameName: String, gameDate: String, gameTime: String, gameDuration: String, playedHero: String, yourKDA: String) {
        if let editingNote = matches.first(where: { $0.id == id }) {
            let index = matches.firstIndex(of: editingNote)
            matches[index!].gameName = gameName
            matches[index!].gameDate = gameDate
            matches[index!].gameTime = gameTime
            matches[index!].gameDuration = gameDuration
            matches[index!].playedHero = playedHero
            matches[index!].yourKDA = yourKDA
        }
    }
}
