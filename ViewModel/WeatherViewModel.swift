//
//  WeatherViewModel.swift
//  Lab1.2
//
//  Created by User on 2023-11-27.
//

import Foundation


class WeatherViewModel: ObservableObject {
    func fetchWeatherData(completion: @escaping (WeatherDataModel?) -> Void) {
            let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max&wind_speed_unit=ms")! 

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print(error ?? "Unknown error")
                    completion(nil)
                    return
                }

                do {
                    let weatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                    completion(weatherData)
                } catch {
                    print(error)
                    completion(nil)
                }
            }

            task.resume()
        }
   
}
