//
//  ResetButtonView.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 3/8/23.
//

import SwiftUI

struct ResetButtonView: View {
    // MARK: Props
    var action: () -> Void
    
    // MARK: UI
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.clockwise.circle.fill")
                .font(.largeTitle)
        }
    }
}

// MARK: - Preview
struct ResetButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ResetButtonView(action: {})
            .previewLayout(.sizeThatFits)
            .padding()
            .background(
                Color(red: 41/255, green: 42/255, blue: 47/255)
            )
    }
}
