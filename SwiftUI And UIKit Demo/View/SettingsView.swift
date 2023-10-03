//
//  SettingsView.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 30/8/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties / States
    @EnvironmentObject var appViewModel: AppViewModel
    @State var title: String = ""
    
    // MARK: - UI
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // MARK: TITLE
            Text("Mood Title")
                .font(.system(size: 22, weight: .semibold))
            
            // MARK: INPUT
            
            /// `SwiftUI`
            // TextField("", text: $title)
            //     .font(.system(size: 18))
            //     .padding(.horizontal, 8)
            //     .frame(height: 58)
            //     .background(Color.white.opacity(0.1))
            //     .cornerRadius(4)
            
            /// `UIKit`
            LegacyTextFieldView(
                text: $title,
                style: .defaultStyle
            )
            .padding(.horizontal, 8)
            .frame(height: 58)
            .background(Color.white.opacity(0.1))
            .cornerRadius(4)
            .tint(.white)

        } //: VStack
        .padding(.top, 137)
        .padding(.horizontal, 24)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(red: 41/255, green: 42/255, blue: 47/255))
        .toolbar {
            
            // MARK: SAVE BUTTON
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button("Save", action: saveAction)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
            } //: ToolbarItem
            
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Events / Actions
    func saveAction() {
        appViewModel.saveMoodTitle(title)
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(title: "Mood")
        }
        .environmentObject(AppViewModel())
    }
}
