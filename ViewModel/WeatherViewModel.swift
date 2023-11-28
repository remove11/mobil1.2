//
//  WeatherViewModel.swift
//  Lab1.2
//
//  Created by User on 2023-11-27.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherDataModel?
    @Published var locationData: [LocationModel] = []
    
    func fetchWeather() {
        // Implement API call to fetch weather data
        // Parse JSON data and update weatherData
    }
    
    func loadSavedData() {
        // Load data from local storage
    }
    
    func saveDataLocally() {
        // Implement local data saving (UserDefaults, CoreData, etc.)
    }
    
    func fetchLocation() {
            let fileName = "locationData" // Replace with the name of your local JSON file

            guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
                print("JSON file not found")
                return
            }

            do {
                let data = try Data(contentsOf: fileURL)
                let locations = try JSONDecoder().decode([LocationModel].self, from: data)
                DispatchQueue.main.async {
                    self.locationData = locations
                }
            } catch {
                print("Error loading or decoding JSON file:", error)
            }
        }
    
    func saveDataToFile(locationData: Data) {
        if let stringRepresentation = String(data: locationData, encoding: .utf8) {
            print(stringRepresentation)
        }
    }
    
    func loadWeatherData() {
            guard let fileURL = Bundle.main.url(forResource: "weatherData", withExtension: "json") else {
                print("JSON file not found")
                return
            }

            do {
                let data = try Data(contentsOf: fileURL)
                let loadedWeatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = loadedWeatherData
                }
            } catch {
                print("Error loading or decoding JSON file:", error)
            }
        }

}
