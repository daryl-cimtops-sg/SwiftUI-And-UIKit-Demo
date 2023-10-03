//
//  LegacyTextFieldView.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 30/8/23.
//

import SwiftUI

struct TextFieldInputStyle {
    var font: String
    var size: CGFloat
    var color: Color
    var alignment: NSTextAlignment
    var keyboardType: UIKeyboardType
}

extension TextFieldInputStyle {
    
    static var defaultStyle: Self {
        .init(
            font: "SF-Pro",
            size: 18,
            color: .white,
            alignment: .left,
            keyboardType: .default
        )
    }
}

struct LegacyTextFieldView: UIViewRepresentable {
    // MARK: - Properties / States
    typealias TextFieldView = UITextField
    
    @Binding var text: String
    
    var style: TextFieldInputStyle
    
    // MARK: - UI
    /// Creates the `UITextField` UIKit View
    func makeUIView(context: Context) -> TextFieldView {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.textColor = .init(style.color)
        textField.font = .init(name: style.font, size: style.size)
        return textField
    }
    
    /// Triggers whenever State changes e.g. `text`
    func updateUIView(_ view: TextFieldView, context: Context) {
        view.text = text
    }
    
    /// Called when view  is created from``makeUIView(context:)``
    /// Lets you communicate from UIkit View to SwiftUI
    /// Useful for conforming to Delegates which lets you listen to events e.g. Text Field Begin Editing
    func makeCoordinator() -> Self.Coordinator {
        .init(text: $text)
    }
}

extension LegacyTextFieldView {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard let text = textField.text else {
                return
            }
            self.text = text
        }
    }
}



// MARK: - Preview
struct LegacyTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LegacyTextFieldView(
            text: .constant("Mood"),
            style: .defaultStyle
        )
        .previewLayout(.sizeThatFits)
        .frame(height: 58)
        .frame(maxWidth: .infinity)
        .tint(.white)
        .background(Color(red: 41/255, green: 42/255, blue: 47/255))
    }
}
