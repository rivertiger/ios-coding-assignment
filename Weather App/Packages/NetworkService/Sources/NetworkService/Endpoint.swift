//
//  File.swift
//  
//
//  Created by James Nguyen on 2/6/23.
//

import Foundation

public struct Endpoint {

    enum Constants {
        static let hostName = "https://api.open-meteo.com"
    }
    let path: String
    let type: EndpointType
    let parameters: [String: Any]
    let queryItems: [String: String]

    public init(path: String,
                type: EndpointType,
                parameters: [String: Any] = [:],
                queryItems: [String: String] = [:]) {
        self.path = path
        self.type = type
        self.parameters = parameters
        self.queryItems = queryItems
    }

    func url() -> URL? { URL(string: Constants.hostName + path)?.appending(queryItems) }
}


extension URL {

    func appending(_ additionalQueryItems: [String: String]) -> URL? {
        guard !additionalQueryItems.isEmpty,
            var urlComponents = URLComponents(string: absoluteString)
        else {
            return absoluteURL
        }

        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        for additionalQueryItem in additionalQueryItems {
            let queryItem = URLQueryItem(name: additionalQueryItem.key, value: additionalQueryItem.value)
            queryItems.append(queryItem)
        }

        urlComponents.queryItems = queryItems

        return urlComponents.url
    }
}

public protocol EndpointBuilder { }
extension EndpointBuilder {
    public func createEndpoint(for city: City) -> Endpoint {
        let tempValue = city.includeTemperature ? "temperature_2m" : ""
        let rainValue = city.includeRain ? "rain" : ""

        var hourlyValue = ""
        if city.includeRain && city.includeTemperature {
            hourlyValue = tempValue + "," + rainValue
        }
        var params = [
            "latitude": String(city.latitude),
            "longitude": String(city.longitude),
            "hourly": hourlyValue
        ]
        if city.isFahrenheit {
            params["temperature_unit"] = "fahrenheit"
        }

        return Endpoint(path: "/v1/forecast", type: .get, queryItems: params)
    }
}
