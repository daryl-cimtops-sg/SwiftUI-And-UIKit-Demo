//
//  ViewExtension.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 3/8/23.
//

import SwiftUI

extension View {
    
    var controller: UIViewController {
        UIHostingController(rootView: self)
    }
    
    var uiView: UIView {
        controller.view
    }
}


