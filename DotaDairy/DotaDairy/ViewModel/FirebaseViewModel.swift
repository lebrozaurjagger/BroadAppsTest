//
//  FirebaseViewModel.swift
//  DotaDairy
//
//  Created by Phillip on 23.06.2024.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigViewModel: ObservableObject {
    @Published var url: URL?
    @Published var isDead: Bool = false
    
    init() {
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
        
        let defaultValue: [String: NSObject] = [
            "url_link": "" as NSObject, // Default URL
            "isDead": false as NSObject, // Default value for isDead
        ]
        remoteConfig.setDefaults(defaultValue)
        
        remoteConfig.fetch { [weak self] (status, error) in
            guard error == nil else {
                print("Error fetching remote config: \(error!)")
                return
            }
            
            remoteConfig.activate { (changed, error) in
                if changed {
                    print("Remote config activated")
                } else {
                    print("No change in remote config")
                }
                
                self?.updateFromRemoteConfig(remoteConfig: remoteConfig)
            }
        }
    }
    
    func updateFromRemoteConfig(remoteConfig: RemoteConfig) {
        if let urlString = remoteConfig.configValue(forKey: "url_link").stringValue {
            self.url = URL(string: urlString)
        }
        
        self.isDead = remoteConfig.configValue(forKey: "isDead").boolValue
    }
}
