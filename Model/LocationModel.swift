//
//  LocationModel.swift
//  Lab1.2
//
//  Created by User on 2023-11-27.
//
import Foundation

struct LocationModel: Codable {
    let place_id: Int
    let licence: String
    let powered_by: String
    let osm_type: String
    let osm_id: Int
    let boundingbox: [String]
    let lat: String
    let lon: String
    let display_name: String
    let locationClass: String
    let type: String
    let importance: Double

    enum CodingKeys: String, CodingKey {
        case place_id
        case licence
        case powered_by = "powered_by"
        case osm_type
        case osm_id
        case boundingbox
        case lat, lon
        case display_name
        case locationClass = "class"
        case type, importance

    }
}

func decodeLocationData1(from jsonData: Data) -> [LocationModel] {
    do {
        let locations = try JSONDecoder().decode([LocationModel].self, from: jsonData)
        return locations
    } catch {
        print("Error decoding JSON:", error)
        return []
    }
}

func decodeLocationData(from jsonData: Data) -> [LocationModel] {
    let hardcodedFilename = "weatherData" 

        guard let fileURL = Bundle.main.url(forResource: hardcodedFilename, withExtension: "json") else {
            print("JSON file not found")
            return []
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let locations = try JSONDecoder().decode([LocationModel].self, from: data)
            return locations
        } catch {
            print("Error loading or decoding JSON file:", error)
            return []
        }
}
