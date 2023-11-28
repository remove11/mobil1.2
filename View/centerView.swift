//
//  centerView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct centerView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            if let weatherData = viewModel.weatherData {
                VStack{
                    Text("\(weatherData.current.temperature2m, specifier: "%.1f")°C")
                    Text("\(weatherData.current.windSpeed10m, specifier: "%.1f")m/s")
                }
                .font(.system(size: 40))
                
                    
                // Use the weather code to determine the image
                Image(systemName: weatherImageName(weatherCode: weatherData.current.weatherCode))
                    .resizable()
                    .frame(width: 150, height: 150)
            } else {
                Text("Loading...")
                    .font(.system(size: 40))
            }
            Button(action: {
                viewModel.loadWeatherData()
            }) {
                Text("Fetch Weather")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .frame(width: 300, height: 300)
        .onAppear {
            viewModel.loadWeatherData()
        }
    }

    // Helper function to return image name based on weather code
    func weatherImageName(weatherCode: Int) -> String {
        switch weatherCode {
        case 1...99: // Example: if weather code is 71, show sun
            return "sun.max"
        // Add more cases for different weather codes
        default:
            return "cloud" // Default image
        }
    }
}

struct centerView_Previews: PreviewProvider {
    static var previews: some View {
        centerView()
    }
}
