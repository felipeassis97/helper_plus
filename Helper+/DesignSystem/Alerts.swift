//
//  Alerts.swift
//  Helper+
//
//  Created by Felipe Assis on 18/4/2025.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let type: ComponentType
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
    @Binding var isPresented: Bool
    
    init(
        title: String,
        message: String,
        type: ComponentType = .success,
        primaryButtonTitle: String = "Continue",
        secondaryButtonTitle: String = "Cancel",
        primaryAction: @escaping () -> Void,
        secondaryAction: @escaping () -> Void,
        isPresented: Binding<Bool>) {
            self.title = title
            self.message = message
            self.type = type
            self.primaryButtonTitle = primaryButtonTitle
            self.secondaryButtonTitle = secondaryButtonTitle
            self.primaryAction = primaryAction
            self.secondaryAction = secondaryAction
            self._isPresented = isPresented
        }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: type.icon())
                    .font(.system(size: 60))
                    .foregroundColor(type.color())
                Text(title)
                    .font(Fonts.titleSmallSemibold)
                    .foregroundColor(Colors.bgInverse)
                    .multilineTextAlignment(.center)
                
                Text(message)
                    .font(Fonts.bodyMediumRegular)
                    .foregroundColor(Colors.bgInverse)
                    .multilineTextAlignment(.center)
                
                VStack {
                    FilledButton(title: primaryButtonTitle,
                                 type: type,
                                 action: {
                        primaryAction()
                        isPresented = false
                    })
                    FilledButton(title: secondaryButtonTitle, outlined: true, type: type,action: {
                        secondaryAction()
                        isPresented = false
                    })
                }
            }
            .padding(30)
            .frame(width: 300)
            .background(Colors.bgLight)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}


struct CustomToastView: View {
    let isTop: Bool
    let message: String
    let duration: TimeInterval
    let type: ComponentType
    @Binding var isPresented: Bool
    
    init(
        isTop: Bool = true,
        message: String,
        duration: TimeInterval = 3.0,
        type: ComponentType = .primary,
        isPresented: Binding<Bool>
    ) {
        self.message = message
        self.duration = duration
        self.isTop = isTop
        self.type = type
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            if isTop {
                Spacer()
            }
            HStack {
                Image(systemName: type.icon())
                    .font(.system(size: 24))
                    .foregroundColor(type.color())
                    .padding(.leading, 12)
                
                Text(message)
                    .font(Fonts.bodyMediumMedium)
                    .foregroundColor(Colors.bgInverse)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
            }
            .background(Colors.bgLight)
            .cornerRadius(10)
            .shadow(Shadows.medium)
            .transition(.move(edge: isTop ? .top : .bottom))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        isPresented = false
                    }
                }
            }
            if !isTop {
                Spacer()
            }
        }
        .padding(.vertical, isTop ? 50 : 10)
        .frame(maxWidth: .infinity)
        .animation(.easeInOut, value: isPresented)
    }
}
