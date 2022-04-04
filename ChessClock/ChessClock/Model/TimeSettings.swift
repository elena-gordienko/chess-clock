//
//  TimeSettings.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import Foundation

// TODO: add implementations for different strategies

enum TimeSettings: String, Equatable, CaseIterable {
    case threeMinutes, fiveMinutes
    
    // FIXME: add an option with a specified time limit
    var name: String {
        switch self {
        case .threeMinutes:
            return "3 minutes"
        case .fiveMinutes:
            return "5 minutes"
        }
    }
    
    var totalTime: Seconds {
        switch self {
        case .threeMinutes:
            return 180
        case .fiveMinutes:
            return 300
        }
    }
}
