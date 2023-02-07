//
//  City.swift
//  
//
//  Created by James Nguyen on 2/6/23.
//

import Foundation

public enum City: String, CaseIterable {
    case NewYork = "New York"
    case Dallas = "Dallas"
    case Miami = "Miami"

    var latitude: Float {
        switch self {
        case .NewYork:
            return 40.71
        case .Dallas:
            return 32.78
        case .Miami:
            return 25.77
        }
    }

    var longitude: Float {
        switch self {
        case .NewYork:
            return -74.01
        case .Dallas:
            return -96.81
        case .Miami:
            return -80.19
        }
    }

    var includeTemperature: Bool {
        return true
    }

    var includeRain: Bool {
        return true
    }

    var isFahrenheit: Bool {
        return true
    }
}
