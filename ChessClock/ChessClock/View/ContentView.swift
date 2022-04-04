//
//  ContentView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var settingsShown = false
    @StateObject var gameSettings: GameSettings = .init()
    
    var body: some View {
        ZStack {
            ClockView(gameState: .init())
                .fullScreenCover(isPresented: $settingsShown) {
                    SettingsView()
                }
            VStack {
                Button {
                    settingsShown = true
                } label: {
                    Image(systemName: Configuration.settingsIconName)
                    .tint(Configuration.controlColor)
                    .font(.system(size: Configuration.controlSize))
                }
                .isHidden(gameSettings.gameInProgress)
                Spacer()
            }
            .padding()
        }.environmentObject(gameSettings)
    }
    
    enum Configuration {
        static let settingsIconName = "gearshape"
        static let controlColor = Color.Palette.accent
        static let controlSize: CGFloat = 50
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
