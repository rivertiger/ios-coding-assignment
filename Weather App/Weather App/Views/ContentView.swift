//
//  ContentView.swift
//  Weather App
//
//  Created by James Nguyen on 2/6/23.
//

import SwiftUI
import NetworkService

struct ContentView: View {
    @EnvironmentObject var viewModel: ListOfCitiesViewModel
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.cities, id: \.self) { item in
                        if let forecast = item as? WeatherForecast {
                            RowContent(city: nil, forecast: forecast)
                        }
                    }
                }
            }
    }
}

struct RowContent: View {
    var city: City?
    var forecast: WeatherDescribing?
    var body: some View {
        let cityName: String = forecast?.cityStore?.rawValue ?? ""
        let temp: String = forecast?.getFirstTemperature() ?? ""
            HStack {
                VStack(alignment: .leading) {
                    Text("city:\(cityName)")
                    Spacer()
                    Text("temp:\(temp)")
                }
                Text("imagePlaceholder")
            }
        .padding(16)
        .background(Color.white)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
