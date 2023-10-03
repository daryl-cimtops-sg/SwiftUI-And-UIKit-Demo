//
//  AppDataRepository.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 3/10/23.
//

import Combine
import Foundation

final class AppDataRepository {
    
    private let key = "MOOD_TITLE"
    
    // MARK: - Dependencies
    let userDefaults: UserDefaults
    
    // MARK: - Data
    @Published var moodTitle = "Mood"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        
        /// Get Initial Title
        getMoodTitle()
    }
        
    // MARK: - Events
    func saveMoodTitle(_ title: String) {
        userDefaults.set(title, forKey: key)
        
        /// Update Title
        getMoodTitle()
    }
    
    func getMoodTitle() {
        let title = userDefaults.string(forKey: key)
        moodTitle = title ?? "Mood"
    }
}

