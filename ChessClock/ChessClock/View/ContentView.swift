//
//  ContentView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ClockView(gameState: .init(), totalTime: 90)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
