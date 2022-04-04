//
//  TimingStrategy.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import Foundation

enum TimingStrategy: Equatable, Hashable {
    case simple(delay: Seconds)
    
    // FIXME: add an option with a specified delay limit
    var name: String {
        switch self {
        case let .simple(delay):
            return "Simple delay: \(delay) seconds"
        }
    }
    
    static var allCases: [TimingStrategy] {
        [.simple(delay: 0)]
    }
}
