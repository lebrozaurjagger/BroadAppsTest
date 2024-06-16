//
//  DataModel.swift
//  DotaDairy
//
//  Created by Phillip on 16.06.2024.
//

import Foundation
import Combine

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

class NetworkManager: ObservableObject {
    @Published var users: [User] = []
    var cancellable: AnyCancellable?
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
    }
}
