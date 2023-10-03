//
//  AppView.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 30/8/23.
//

import SwiftUI

struct AppView: View {
    // MARK: - Properties / States
    @StateObject var appViewModel: AppViewModel = .init()
    
    // MARK: - UI
    var body: some View {
        NavigationView {
            HomeView()
        }
        .sheet(isPresented: $appViewModel.isSettingsShown) {
            
            NavigationView {
                SettingsView(title: appViewModel.moodTitle)
            }
            
        }
        .environmentObject(appViewModel)
    }
    
    // MARK: - Events / Actions
}

// MARK: - Preview
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(AppViewModel())
    }
}
