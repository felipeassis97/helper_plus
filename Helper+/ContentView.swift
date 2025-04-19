//
//  ContentView.swift
//  Helper+
//
//  Created by Felipe Assis on 16/4/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var showTopToast = false
    @State private var showBottomToast = false
    var body: some View {
        
        ZStack {
            VStack {
                Button("Show Alert") {
                    showAlert = true
                }
                Button("Show Top Toast") {
                    showTopToast = true
                }
                .padding()
                
                Button("Show Bottom Toast") {
                    showBottomToast = true
                }
                
                Rectangle()
                    .fill(Colors.bgError)
                    .frame(width: 100, height: 100)
                    .shadow(Shadows.medium)
                    .cornerRadius(10)
                
                
                PrimaryButton(title: "Test") {}
                
                HStack {
                    FilledButton(title: "Test") {}
                    FilledButton(title: "Test", outlined: true) {}
                    FilledButton(title: "Test", icon: Assets.iconSend,  type: .success) {}
                    FilledButton(title: "Test", type: .error) {}
                }
                
               
                
                CustomTextField(
                    text: $text,
                    placeholder: "Search",
                    prefixIcon: Assets.iconSend,
                    suffixIcon: Assets.iconSend,
                    onChange: { oldValue, newValue in
                        print("Text changed from: \(oldValue) to: \(newValue)")
                    }
                )
                CustomSecureField(
                    text: $password,
                    placeholder: "Password",
                    prefixIcon: Assets.iconSend,
                    onChange: { oldValue, newValue in
                        print("Text changed from: \(oldValue) to: \(newValue)")
                    }
                )
                
                
                
            }
            .padding(.horizontal, 20)
            
            if showTopToast {
                CustomToastView(
                    message: "This is a custom top toast message!",
                    isPresented: $showTopToast
                )
            }
            
            if showBottomToast {
                CustomToastView(
                    isTop: false,
                    message: "This is a custom bottom toast message!",
                    duration: 3.0,
                    type: .success,
                    isPresented: $showBottomToast
                )
            }
            
            if showAlert {
                CustomAlertView(
                    title: "Verify your phone number",
                    message: "Is this correct? +8801995867406 This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message! This is a custom top toast message!",
                    primaryAction: {
                        print("Yes button tapped!")
                    },
                    secondaryAction: {
                        print("No button tapped!")
                    },
                    isPresented: $showAlert
                )
            }
        }
        
    }
}

#Preview {
    ContentView()
}
