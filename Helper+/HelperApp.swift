//
//  Helper_App.swift
//  Helper+
//
//  Created by Felipe Assis on 16/4/2025.
//

import SwiftUI

@main
struct HelperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
        }
        
    }
    
}
