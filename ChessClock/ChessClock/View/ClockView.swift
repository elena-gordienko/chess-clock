//
//  ClockView.swift
//  ChessClock
//
//  Created by Elena Gordienko on 29.03.2022.
//

import Combine
import SwiftUI

struct ClockView: View {
    @EnvironmentObject var gameSettings: GameSettings
    
    @StateObject var gameState: GameState
    
    @State var remainingTimeWhite: Seconds = 0
    @State var remainingTimeBlack: Seconds = 0
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    init(gameState: GameState) {
        _gameState = StateObject(wrappedValue: gameState)
    }
    
    var body: some View {
        ZStack {
            Configuration.backgroundColor.ignoresSafeArea()
            HStack(alignment: .center) {
                whiteWatchface
                Spacer(minLength: 20)
                blackWatchface
            }
            .padding()
            VStack(alignment: .center) {
                currentPlayerIcon
                Spacer()
                controlsView
            }
            .padding()
        }
        .onReceive(timer) { _ in
            handleTimerEvent()
        }.onChange(of: gameSettings.totalTime) { newValue in
            updateRemainingTime(with: newValue)
        }.onAppear {
            updateRemainingTime(with: gameSettings.totalTime)
        }
    }
    
    var currentPlayerIcon: some View {
        Image(systemName: gameState.isWhiteTurn
              ? Configuration.whiteChessPiece
              : Configuration.blackChessPiece
        )
        .font(.system(size: Configuration.controlSize))
        .foregroundColor(Configuration.playerIconColor)
        .isHidden(!gameState.inProgress)
    }
    
    var whiteWatchface: some View {
        WatchfaceView(
            remainingTime: $remainingTimeWhite,
            isActive: $gameState.isWhiteTurn
        )
    }

    var blackWatchface: some View {
        WatchfaceView(
            remainingTime: $remainingTimeBlack,
            isActive: $gameState.isBlackTurn
        )
    }
    
    var playButton: some View {
        Button {
            gameState.state = gameState.inProgress
                ? .ready
                : .inProgress(isWhiteTurn: true)
            gameSettings.gameInProgress = gameState.inProgress
        } label: {
            Image(systemName: gameState.inProgress
                  ? Configuration.stopIconName
                  : Configuration.playIconName
            )
            .tint(Configuration.controlColor)
            .font(.system(size: Configuration.controlSize))
        }
    }
    
    var switchButton: some View {
        Button {
            guard case let .inProgress(isWhite) = gameState.state else { return }
            gameState.state = .inProgress(isWhiteTurn: !isWhite)
        } label: {
            Image(systemName: Configuration.switchIconName)
                .tint(Configuration.controlColor)
                .font(.system(size: Configuration.controlSize))
        }
        .isHidden(!gameState.inProgress)
    }
    
    var controlsView: some View {
        HStack(alignment: .center) {
            switchButton
                .disabled(gameState.isBlackTurn)
            Spacer()
            playButton
            Spacer()
            switchButton
                .disabled(gameState.isWhiteTurn)
        }
    }

    private func handleTimerEvent() {
        guard case let .inProgress(isWhite) = gameState.state else { return }
        let remainingTime = isWhite ? remainingTimeWhite : remainingTimeBlack
        guard remainingTime > 0 else {
            gameState.state = .timeRanOut
            gameSettings.gameInProgress = false
            return
        }
        if isWhite {
            remainingTimeWhite -= 1
        } else {
            remainingTimeBlack -= 1
        }
    }
    
    
    private func updateRemainingTime(with totalTime: Seconds) {
        remainingTimeBlack = totalTime
        remainingTimeWhite = totalTime
    }
    
    enum Configuration {
        static let backgroundColor = Color.Palette.background
        static let controlColor = Color.Palette.accent
        static let playerIconColor = Color.Palette.secondaryText
        static let playIconName = "play.circle"
        static let stopIconName = "stop.circle"
        static let whiteChessPiece = "person"
        static let blackChessPiece = "person.fill"
        static let switchIconName = "stopwatch"
        static let controlSize: CGFloat = 50
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(gameState: .init())
    }
}
