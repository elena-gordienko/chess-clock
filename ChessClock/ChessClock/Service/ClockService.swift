//
//  ClockService.swift
//  ChessClock
//
//  Created by Elena Gordienko on 29.03.2022.
//

import Foundation

final class ClockService {
    static let shared = ClockService()
    
    func string(for time: Seconds) -> String {
        let minutes = time / Configuration.secondsInMinute
        let seconds = time % Configuration.secondsInMinute
        return "\(timeUnitString(for: minutes)):\(timeUnitString(for: seconds))"
    }
    
    private func timeUnitString(for timeUnit: UInt) -> String {
        "\((timeUnit < 10) ? "0" : "")\(timeUnit)"
    }
    
    enum Configuration {
        static let secondsInMinute: Seconds = 60
    }
}
