//
//  File.swift
//  
//
//  Created by James Nguyen on 2/6/23.
//

import Foundation
protocol HourlyUnitsDescribing: Codable {
    var time: String? { get set }
    var temperature: String? { get set }
    var rain: String? { get set }
}

public struct HourlyUnitsObject: HourlyUnitsDescribing {
    var time: String?
    var temperature: String?
    var rain: String?

    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case rain
    }
}

public protocol HourlyTimeCollectionDescribing: Codable {
    var times: [String]? { get set }
    var temperatures: [Float]? { get set }
    var rain: [Float]? { get set }
}

public struct HourlyObjects: HourlyTimeCollectionDescribing {
    public var times: [String]?
    public var temperatures: [Float]?
    public var rain: [Float]?

    enum CodingKeys: String, CodingKey {
        case times = "time"
        case temperatures = "temperature_2m"
        case rain
    }
}


public protocol WeatherDescribing: Codable {
    var latitude: Float { get set }
    var longitude: Float { get set }
    var generationTime: Float { get set }
    var utcOffsetInSeconds: Int { get set }
    var timezone: String { get set }
    var elevation: Float { get set }
    var hourlyUnits: HourlyUnitsObject { get set }
    var hourly: HourlyObjects { get set }
    var cityStore: City? { get set }
}

extension WeatherDescribing {
    public func getMatchingLatitude(for cities:[City]) -> City? {
        for city in cities {
            let latTruncated = city.latitude.clean
            let cleaned = latitude.clean
            let isMatch = latTruncated == cleaned
            if isMatch {
                return city
            } else {
                continue
            }
        }
        return nil
    }

    //gets the first temperature
    public func getFirstTemperature() -> String? {
        guard let value = hourly.temperatures?.first else { return nil }
        return String(format: "%.2f",value)
    }

    public func getFirstTime() -> String? {
        return hourly.times?.first
    }

    public func getFirstRain() -> String? {
        guard let value = hourly.rain?.first else { return nil }
        return String(format: "%.2f",value)
    }
}

extension Float {
    var clean: String {
       return String(format: "%.2f", self)
    }
}

public class WeatherForecast: WeatherDescribing {
    public var latitude: Float
    public var longitude: Float
    public var generationTime: Float
    public var utcOffsetInSeconds: Int
    public var timezone: String
    public var elevation: Float
    public var hourlyUnits: HourlyUnitsObject
    public var hourly: HourlyObjects
    public var cityStore: City?

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case generationTime = "generationtime_ms"
        case utcOffsetInSeconds = "utc_offset_seconds"
        case timezone
        case elevation = "elevation"
        case hourlyUnits = "hourly_units"
        case hourly
    }

    public func assignCityToObject(for cityAssigned: City) {
        cityStore = cityAssigned
    }

}

extension WeatherForecast: Hashable {
    var identifier: String {
        return UUID().uuidString
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    public static func == (lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
