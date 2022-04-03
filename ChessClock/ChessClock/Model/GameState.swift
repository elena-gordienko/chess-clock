//
//  GameState.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import Foundation

final class GameState: ObservableObject {
    @Published var isWhiteTurn = false
    @Published var isBlackTurn = false
    @Published var inProgress = false

    var state: GameStatus = .ready {
        didSet {
            switch state {
            case let .inProgress(isWhite):
                isWhiteTurn = isWhite
                isBlackTurn = !isWhite
                inProgress = true
            case .timeRanOut:
                inProgress = false
            case .ready:
                isWhiteTurn = false
                isBlackTurn = false
                inProgress = false
            }
        }
    }
}

