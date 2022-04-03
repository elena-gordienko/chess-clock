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
    
    @State var remainingTimeWhite: Seconds
    @State var remainingTimeBlack: Seconds
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    init(gameState: GameState, totalTime: Seconds) {
        _gameState = StateObject(wrappedValue: gameState)
        self.totalTime = totalTime
        remainingTimeWhite = totalTime
        remainingTimeBlack = totalTime
    }
    
    var body: some View {
        ZStack {
            Configuration.backgroundColor.ignoresSafeArea()
            HStack(alignment: .center) {
                whiteWatch
                Spacer(minLength: 20)
                blackWatch
            }
            .padding()
        }
        .onReceive(timer) { _ in
            handleTimerEvent()
        }
    }
    
    
    var whiteWatch: some View {
        WatchfaceView(
            remainingTime: $remainingTimeWhite,
            isActive: $gameState.isWhiteTurn
        )
    }

    var blackWatch: some View {
        WatchfaceView(
            remainingTime: $remainingTimeBlack,
            isActive: $gameState.isBlackTurn
        )
    }

    private func handleTimerEvent() {
        guard case let .inProgress(isWhite) = gameState.state else { return }
        let remainingTime = isWhite ? remainingTimeWhite : remainingTimeBlack
        guard remainingTime > 0 else {
            gameState.state = .timeRanOut
            return
        }
        if isWhite {
            remainingTimeWhite -= 1
        } else {
            remainingTimeBlack -= 1
        }
    }
    enum Configuration {
        static let backgroundColor = Color.Palette.background
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(gameState: .init(), totalTime: 90)
    }
}
