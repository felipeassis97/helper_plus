//
//  Shadows.swift
//  Helper+
//
//  Created by Felipe Assis on 17/4/2025.
//


import SwiftUI

struct Shadows {
    static let xsmall: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) =
        (color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)

    static let small: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) =
        (color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)

    static let medium: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) =
        (color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)

    static let large: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) =
        (color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)

    static let xlarge: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) =
    (color: Color.black.opacity(0.25), radius: 16, x: 0, y: 8)
}


extension View {
    func shadow(_ shadowType: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)) -> some View {
        self.shadow(color: shadowType.color, radius: shadowType.radius, x: shadowType.x, y: shadowType.y)
    }
}
