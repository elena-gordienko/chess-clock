//
//  GameStatus.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import Foundation

// TODO: add pause

enum GameStatus: Equatable {
    case ready
    case inProgress(isWhiteTurn: Bool)
    case timeRanOut
}
