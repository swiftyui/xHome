//
//  Global.swift
//
//  Created by LW on 28/8/20.
//

import Foundation

let MINUTE = 60
let HOUR = MINUTE * 60
let DAY = HOUR * 24

struct Format {
    static func COUNTDOWN(totalSeconds: Int) -> String {
        // Count
        let pastJump = totalSeconds <= 0
        let prefix = "\(pastJump ? "-" : "")"
        let timeToJumpInSec = abs(totalSeconds)

        // >= 24 hrs
        let days = Int(floor(Double(timeToJumpInSec / DAY)))
        if days > 0 {
            return "\(prefix)\(days) \(days == 1 ? "day" : "days")"
        }

        // >=2 hrs
        let hours = Int(floor(Double(timeToJumpInSec / HOUR)))
        let hourStringPrefixed = "\(prefix)\(hours)h"
        if hours >= 2 {
            return hourStringPrefixed
        }

        // >= 1 hr
        let minutes = Int(floor(Float(timeToJumpInSec) / Float(MINUTE))) % 60
        let minuteString = "\(minutes)m"
        if hours > 0, minutes > 0 {
            return "\(hourStringPrefixed) (minutes)m"
        }
        if hours > 0 {
            return hourStringPrefixed
        }

        // >= 5 mins
        if minutes >= 5 {
            return "\(prefix)\(minuteString)"
        }

        // >= 1 min
        let seconds = Int(floor(Double(timeToJumpInSec % MINUTE)))
        let secondString = "\(seconds)s"
        if minutes > 0, seconds > 0 {
            return "\(prefix)\(minuteString) \(secondString)"
        }
        if minutes > 0 {
            return "\(prefix)\(minuteString)"
        }

        // > 0 seconds
        if seconds > 0 {
            return "\(prefix)\(secondString)"
        }

        // 0 seconds
        return "\(secondString)"
    }
}
