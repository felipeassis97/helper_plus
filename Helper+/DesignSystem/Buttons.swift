//
//  Buttons.swift
//  Helper+
//
//  Created by Felipe Assis on 17/4/2025.
//

import SwiftUI

enum ComponentType {
    case primary, secondary, warning, success, error
    
    func color() -> Color {
        return switch self {
        case .primary:
            Colors.primaryAccent
        case .secondary:
            Colors.bgSecondary
        case .warning:
            Colors.warning
        case .success:
            Colors.success
        case .error:
            Colors.error
        }
    }
    
    func icon() -> String {
        return switch self {
        case .primary:
            "checkmark.circle.fill"
        case .secondary:
            "checkmark.circle.fill"
        case .warning:
            "exclamationmark.triangle.fill"
        case .success:
            "checkmark.circle.fill"
        case .error:
            "exclamationmark.circle.fill"
        }
    }
}

struct PrimaryButton: View {
    let title: String
    let icon: String?
    let outlined: Bool
    let type: ComponentType
    let action: () -> Void
    
    init(
        title: String,
        icon: String? = nil,
        outlined: Bool = false,
        type: ComponentType = .primary,
        action: @escaping () -> Void) {
            self.title = title
            self.icon = icon
            self.outlined = outlined
            self.action = action
            self.type = type
        }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(Fonts.bodyLargeSemibold)
                    .foregroundColor(outlined ? type.color() : Colors.contentOnColor)
                if let iconName = icon {
                    Image(iconName)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(outlined ? type.color() : Colors.contentOnColor)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(outlined ? .clear : type.color())
            .cornerRadius(Corners.medium)
            .overlay(
                RoundedRectangle(cornerRadius: Corners.medium)
                    .stroke(type.color(), lineWidth: outlined ? 2 : 0)
            )
            .shadow(Shadows.medium)
        }
    }
}



struct FilledButton: View {
    let title: String
    let icon: String?
    let outlined: Bool
    let maxWidth: Bool
    let type: ComponentType
    let action: () -> Void
    
    
    init(
        title: String,
        icon: String? = nil,
        outlined: Bool = false,
        maxWidth: Bool = false,
        type: ComponentType = .primary,
        action: @escaping () -> Void) {
            self.title = title
            self.icon = icon
            self.outlined = outlined
            self.action = action
            self.maxWidth = maxWidth
            self.type = type
        }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(Fonts.bodyMediumSemibold)
                    .foregroundColor(outlined ? type.color() : Colors.contentOnColor)
                if let iconName = icon {
                    Image(iconName)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(outlined ? type.color() : Colors.contentOnColor)
                }
            }
            .frame(maxWidth: maxWidth ? .infinity : nil)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .padding(.all, 8)
            .background(outlined ? .clear : type.color())
            .cornerRadius(Corners.small)
            .overlay(
                RoundedRectangle(cornerRadius: Corners.small)
                    .stroke(type.color(), lineWidth: outlined ? 2 : 0)
            )
            .shadow(Shadows.medium)
        }
    }
}
