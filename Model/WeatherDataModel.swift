//
//  WeatherDataModel.swift
//  Lab1.2
//
//  Created by User on 2023-11-27.
//

import Foundation

// Main Weather Data struct
struct WeatherDataModel: Codable{
    let latitude: Double
    let longitude: Double
    let generationtimeMs: Double
    let utcOffsetSeconds: Int
    let timezone: String
    let timezoneAbbreviation: String
    let elevation: Double
    let currentUnits: Units
    let current: CurrentWeather
    let hourlyUnits: Units
    let hourly: HourlyWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMs = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

// Units struct for both current and hourly data
struct Units: Codable {
    let time: String
    let temperature2m: String
    let weatherCode: String
    let windSpeed10m: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2m = "temperature_2m"
        case weatherCode = "weather_code"
        case windSpeed10m = "wind_speed_10m"
    }
}

// Current weather data struct
struct CurrentWeather: Codable {
    let time: String
    let interval: Int
    let temperature2m: Double
    let weatherCode: Int
    let windSpeed10m: Double

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2m = "temperature_2m"
        case weatherCode = "weather_code"
        case windSpeed10m = "wind_speed_10m"
    }
}

// Hourly weather data struct
struct HourlyWeather: Codable {
    let time: [String]
    let temperature2m: [Double]
    let weatherCode: [Int]
    let windSpeed10m: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2m = "temperature_2m"
        case weatherCode = "weather_code"
        case windSpeed10m = "wind_speed_10m"
    }
}



