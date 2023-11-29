// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import Network
import CoreData

// MARK: - Welcome
struct WeatherData: Codable {
    let latitude, longitude, generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone, timezone_abbreviation: String
    let elevation: Int
    let current_units: Units
    let current: Current
    let hourly_units: Units
    let hourly: Hourly
    let daily_units: DailyUnits
    let daily: Daily
}

// MARK: - Current
struct Current: Codable {
    let time: String
    let interval: Int
    let temperature_2m: Double
    let weather_code: Int
    let wind_speed_10m: Double
}

// MARK: - Units
struct Units: Codable {
    let time: String
    let interval: String?
    let temperature_2m, weather_code, wind_speed_10m: String
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let weather_code: [Int]
    let temperature_2m_max, wind_speed_10m_max: [Double]
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, weather_code, temperature_2m_max, wind_speed_10m_max: String
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let temperature_2m: [Double]
    let weather_code: [Int]
    let wind_speed_10m: [Double]
}


class WeatherDataModel: Observable, ObservableObject {
    let monitor = NWPathMonitor()
    @Published var wData: WeatherData? = nil
    @Published var isConnected = false
    var longitude = 13.41
    var latitude = 52.52
    
    init() {
            monitor.pathUpdateHandler = { path in
                DispatchQueue.main.async {
                    let isConnectedTemp = path.status == .satisfied
                    
                    if(!isConnectedTemp && self.wData == nil){
                        self.wData = self.loadData()
                    }
                    
                    if(!self.isConnected && isConnectedTemp){
                        self.fetchWeatherData() { data in
                            if let saved = data {
                                self.saveData(data: saved)
                            }
                        }
                    }
                    
                    self.isConnected = isConnectedTemp
                }
            }
            let queue = DispatchQueue(label: "NetworkMonitor")
            monitor.start(queue: queue)
        }
    
    func fetchWeatherData(completion: @escaping (WeatherData?) -> Void) {
        if(!self.isConnected){
            return
        }
            
            
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude="+String(self.latitude)+"&longitude="+String(self.longitude)+"&current=temperature_2m,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,wind_speed_10m_max&wind_speed_unit=ms&timezone=Europe%2FLondon")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                
                completion(nil)
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from:  data)
                DispatchQueue.main.async {
                    self.wData = weatherData
                    completion(weatherData)
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    func getDayOfWeek(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: wData?.utc_offset_seconds ?? 0) // Adjust time zone if needed
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEE"
            let dayOfWeekString = dateFormatter.string(from: date)
            return dayOfWeekString
        } else {
            return nil 
        }
    }
    
    func weatherImageName(weatherCode: Int?) -> String {
        guard let code = weatherCode else { return "questionmark" }
        
        switch code {
        case 0...3:
            return "sun.max"
        case 4...60:
            return "cloud.fog"
        case 61...70:
            return "cloud.rain"
        case 71...79:
            return "cloud.snow"
        case 80...84:
            return "cloud.rain"
        case 85...90:
            return "snowflake"
        case 91...95:
            return "tornado"
        case 96...99:
            return "cloud.bolt.rain"
        default:
            return "figure.gymnastics"
        }
        
    }
    
    private func loadData() -> WeatherData?{
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode(WeatherData.self, from: data) {
                return decoded
            }
        }
        return nil
    }
    
    private func saveData(data: WeatherData) {
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
}
             
