//
//  TopView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct topView: View {
    @EnvironmentObject var weatherData: WeatherDataModel
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    var body: some View {
        VStack {
            // Customized Text Fields
            TextField("Fill Latitude", text: $latitude)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
                .multilineTextAlignment(.center)
            TextField("Fill Longitude", text: $longitude)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
                .multilineTextAlignment(.center)
            // Customized Submit Button
            Button("Submit") {
                submitCoordinates()
            }
            .foregroundColor(.blue)
            .cornerRadius(20)
        }
        .font(.system(size: 25))
        .frame(width: 200, height: 180)
        .cornerRadius(30)
    }
        
    
func submitCoordinates() {
        // Validate and use the coordinates
        if let lat = Double(latitude), let lon = Double(longitude) {
            print("Latitude: \(lat), Longitude: \(lon)")
            weatherData.latitude = lat
            weatherData.longitude = lon
            weatherData.fetchWeatherData { data in
                print(data)
            }
            // Further processing
        } else {
            print("Invalid input")
            // Handle invalid input
        }
    }
}

#Preview {
    topView()
}
