//
//  WatchfaceView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import SwiftUI

struct WatchfaceView: View {
    @Binding var remainingTime: Seconds
    @Binding var isActive: Bool
    
    var body: some View {
        Text(timeString(for: remainingTime))
            .font(.system(size: 100))
            .foregroundColor(
                isActive
                    ? Configuration.activeTextColor
                    : Configuration.inactiveTextColor
            )
            .monospacedDigit()
    }
    
    private func timeString(for time: Seconds) -> String {
        ClockService.shared.string(for: time)
    }
    
    struct Configuration {
        static let activeTextColor: Color = Color.Palette.primaryText
        static let inactiveTextColor: Color = Color.Palette.tertiaryText

    }
}

struct WatchfaceView_Previews: PreviewProvider {
    static var previews: some View {
        WatchfaceView(
            remainingTime: .constant(90),
            isActive: .constant(false)
        )
    }
}
