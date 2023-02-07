//
//  ListOfCitiesViewModel.swift
//  Weather App
//
//  Created by James Nguyen on 2/6/23.
//

import Foundation
import NetworkService
import Combine

class ListOfCitiesViewModel: EndpointBuilder, ObservableObject {
    let networkService: LocationsNetworkServicing
    @Published var cities: [WeatherForecast] = []
    private var cancellables: Set<AnyCancellable> = []

    init(with networkService: LocationsNetworkServicing = LocationsNetworkService()) {
        self.networkService = networkService
    }

    func onAppear() {
        let endpointNY = createEndpoint(for: .NewYork)
        let endpointMiami = createEndpoint(for: .Miami)
        let endpointDallas = createEndpoint(for: .Dallas)

        Publishers.Zip3(
            networkService.fetchWeatherForecastPublisher(endpoint: endpointNY),
            networkService.fetchWeatherForecastPublisher(endpoint: endpointMiami),
            networkService.fetchWeatherForecastPublisher(endpoint: endpointDallas)
        )
        .receive(on: RunLoop.main)
        .sink(
                   receiveCompletion: { print($0) },
                   receiveValue: { [weak self] newyork, miami, dallas in
                       self?.cities = [newyork, miami, dallas]
                       let cities = [newyork, miami, dallas]
                       let populatedCities = self?.assignCityNames(from: cities)
                       self?.cities = populatedCities ?? []
                   }
               )
        .store(in: &cancellables)
    }

    func assignCityNames(from forecasts: [WeatherForecast]) -> [WeatherForecast] {
        for forecast in forecasts {
            if let matchingCity = forecast.getMatchingLatitude(for: [City.NewYork, City.Miami, City.Dallas]) {
                forecast.assignCityToObject(for: matchingCity)
            }
        }
        return forecasts
    }

}
