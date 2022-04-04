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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    backButton
                        .padding(.vertical, 10)
                    picker
                        .padding(.horizontal, 56)
                    Spacer()
                }
                Spacer()
            }.padding([.leading, .top], 10)
        }.onChange(of: selectedTime) { newValue in
            gameSettings.timeSettings = newValue
        }.onAppear {
            selectedTime = gameSettings.timeSettings
        }
    }
    
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: Configuration.doneImageName)
            .tint(Configuration.controlColor)
            .font(.system(size: Configuration.controlSize))
            Text("Settings")
                .font(.largeTitle)
                .tint(Color.Palette.primaryText)
        }
    }
    
    var picker: some View {
        VStack(alignment: .leading) {
            Text("Choose time")
                .font(.title2)
                .tint(Color.Palette.primaryText)
            Picker(selection: $selectedTime, label: Text("Pick time limit per player")) {
                ForEach(Array(TimeSettings.allCases), id: \.self) {
                    Text($0.name)
                }
            }
        }
    }
    
    enum Configuration {
        static let doneImageName = "arrow.backward.circle"
        static let controlColor = Color.Palette.accent
        static let controlSize: CGFloat = 40
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
