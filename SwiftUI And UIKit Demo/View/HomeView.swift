//
//  HomeView.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 3/8/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties / States
    @EnvironmentObject var appViewModel: AppViewModel
    
    // MARK:  - UI
    var body: some View {
        VStack(spacing: 22) {
            
            // MARK: TITLE
            Text(appViewModel.moodTitle)
                .foregroundColor(.white)
                .font(.system(size: 34, weight: .semibold))
            
            // MARK: MOOD
            Text(appViewModel.isHappy ? "😁" : "😔")
                .font(.system(size: 84))
            
            // MARK: CHEER UP BUTTON
            Button(action: cheerUpAction) {
                Text("Cheer Up")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                    .padding(18)
                    .background(Color.accentColor)
                    .cornerRadius(5)
            }
            
            // MARK: RESET MOOD BUTTON
            ResetButtonView(action: resetAction)
            
        } //: VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 41/255, green: 42/255, blue: 47/255))
        .ignoresSafeArea()
        .toolbar {
            
            // MARK: SETTINGS BUTTON
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: settingsAction) {
                    
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                } //: Button
                
            } //: ToolbarItem
        }
    }
    
    // MARK: - Events / Actions
    func cheerUpAction() {
        withAnimation {
            appViewModel.cheerUp()
        }
    }
    
    func resetAction() {
        withAnimation {
            appViewModel.reset()
        }
    }
    
    func settingsAction() {
        appViewModel.navigateToSettings()
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .environmentObject(AppViewModel())
    }
}


