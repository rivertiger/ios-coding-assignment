//
//  Weather_AppApp.swift
//  Weather App
//
//  Created by James Nguyen on 2/6/23.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    @StateObject var viewModel = ListOfCitiesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .onAppear() {
                    viewModel.onAppear()
                }
        }
    }
}
