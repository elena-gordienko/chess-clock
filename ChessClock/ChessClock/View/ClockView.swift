//
//  ClockView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 29.03.2022.
//

import Combine
import SwiftUI

struct ClockView: View {
    @StateObject var gameState: GameState
    
    @State var totalTime: Seconds
    
    init(gameState: GameState, totalTime: Seconds) {
        _gameState = StateObject(wrappedValue: gameState)
        self.totalTime = totalTime
    }
    
    var body: some View {
        Text("Hello")
    }
    
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(gameState: .init(), totalTime: 90)
    }
}
