//
//  SettingsView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var gameSettings: GameSettings
    @State var selectedTime: TimeSettings = .threeMinutes
    
    var body: some View {
        ZStack {
            Color.Palette.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Pick time limit")
                    .font(.largeTitle)
                    .tint(Color.Palette.primaryText)
                Picker(selection: $selectedTime, label: Text("Pick time limit per player")) {
                    ForEach(Array(TimeSettings.allCases), id: \.self) {
                        Text($0.name)
                            .font(.largeTitle)
                            .tint(Color.Palette.primaryText)
                    }
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: Configuration.doneImageName)
                    .tint(Configuration.controlColor)
                    .font(.system(size: Configuration.controlSize))
                }
            }
        }.onChange(of: selectedTime) { newValue in
            gameSettings.timeSettings = newValue
        }.onAppear {
            selectedTime = gameSettings.timeSettings
        }
    }
    
    enum Configuration {
        static let doneImageName = "arrow.backward.circle"
        static let controlColor = Color.Palette.accent
        static let controlSize: CGFloat = 50
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
