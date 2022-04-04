//
//  GameSettings.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import Foundation

typealias Seconds = UInt

final class GameSettings: ObservableObject {
    @Published var totalTime: Seconds = TimeSettings.threeMinutes.totalTime
    @Published var timingStrategy: TimingStrategy = .simple(delay: 0)
    @Published var gameInProgress: Bool = false
    
    var timeSettings: TimeSettings = .threeMinutes {
        didSet {
            totalTime = timeSettings.totalTime
        }
    }
}
