//
//  centerView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct centerView: View {
    @EnvironmentObject var weatherData: WeatherDataModel
    
    
    var body: some View {
        VStack {
            VStack{
                Text(String(weatherData.wData?.current.temperature_2m ?? 0.0)+" C")
                Text(String(weatherData.wData?.current.wind_speed_10m ?? 0.0)+" m/s")
            }
            .font(.system(size: 40))
            Image(systemName: weatherData.weatherImageName(weatherCode: weatherData.wData?.current.weather_code))

                    .resizable()
                    .frame(width: 150, height: 150)
            if(!weatherData.isConnected){
                Text("Offline mode")
            }
        }
        .frame(width: 300, height: 200)
        
    }

    
}

struct centerView_Previews: PreviewProvider {
    static var previews: some View {
        centerView()
    }
}
