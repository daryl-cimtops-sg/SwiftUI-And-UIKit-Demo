//
//  AppViewModel.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 30/8/23.
//

import Combine

final class AppViewModel: ObservableObject {
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Dependencies
    let appDataRepository: AppDataRepository
    
    // MARK: - Data
    @Published private(set) var moodTitle: String = "Mood"
    @Published private(set) var isHappy: Bool = false
    
    // MARK: - UI
    @Published var isSettingsShown: Bool = false
    
    init(appDataRepository: AppDataRepository = .init()) {
        self.appDataRepository = appDataRepository
        republishMoodTitle()
    }
    
    // MARK: - Events
    func republishMoodTitle() {
        appDataRepository.$moodTitle
            .sink { [weak self] in self?.moodTitle = $0 }
            .store(in: &subscriptions)
    }
    
    func saveMoodTitle(_ title: String) {
        guard !title.isEmpty else {
            isSettingsShown.toggle()
            return
        }
        appDataRepository.saveMoodTitle(title)
        isSettingsShown.toggle()
    }
    
    func cheerUp() {
        isHappy = true
    }
    
    func reset() {
        isHappy = false
    }
    
    func navigateToSettings() {
        isSettingsShown = true
    }
}
