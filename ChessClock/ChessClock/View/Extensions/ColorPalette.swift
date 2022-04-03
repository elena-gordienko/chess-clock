//
//  ColorPalette.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import SwiftUI

extension Color {
    enum Palette {
        static let accent = Color("AccentColor")
        static let background = Color("Background")
        static let primaryText = Color("PrimaryText")
        static let secondaryText = Color("SecondaryText")
        static let tertiaryText = Color("SecondaryText").opacity(0.3)
    }
}
