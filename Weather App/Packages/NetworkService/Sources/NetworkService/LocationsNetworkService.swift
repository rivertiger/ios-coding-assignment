//
//  LocationsNetworkService.swift
//  Weather App
//
//  Created by James Nguyen on 12/15/22.
//

import Foundation
import Combine

public protocol LocationsNetworkServicing {
    func fetchWeatherForecast(endpoint: Endpoint,
                              completionHandler: @escaping (Result<WeatherForecast, CustomError>) -> Void)
    func fetchWeatherForecastPublisher(endpoint: Endpoint) -> AnyPublisher<WeatherForecast, CustomError>
}

public struct LocationsNetworkService: LocationsNetworkServicing {
    private var networkService: NetworkServicing

    private enum Constants {
        static let locationsUrl = "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&hourly=temperature_2m,rain"
    } //For testing only

    public init(networkService: NetworkServicing = NetworkService(urlSession: URLSession.shared)) {
        self.networkService = networkService
    }

    public func fetchWeatherForecast(endpoint: Endpoint,
                                     completionHandler: @escaping (Result<WeatherForecast, CustomError>) -> Void) {
        networkService.makeRequest(endpoint: endpoint) { (result: Result<WeatherForecast, CustomError>) in
            completionHandler(result)
        }
    }

    //Alternate Using Combine
    public func fetchWeatherForecastPublisher(endpoint: Endpoint) -> AnyPublisher<WeatherForecast, CustomError> {
        return networkService.makeRequestWithPublisher(endpoint: endpoint)
            .eraseToAnyPublisher()
    }
}




