//
//  7dayView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI



struct sevenDayView: View {
    @EnvironmentObject var weatherData: WeatherDataModel
    
    // Fyll denna med 7 dagars data

var body: some View {
ScrollView(.horizontal, showsIndicators: false) {
    HStack(spacing: 20) {
        ForEach(0..<7) { idx in
            VStack {
                if let dateString = weatherData.wData?.daily.time[idx],
                let dayOfWeek = weatherData.getDayOfWeek(from: dateString) {
                        Text(dayOfWeek)
                            .font(.system(size: 30, weight: .semibold))
                    
                    } else {
                        Text("N/A") // Or any placeholder text
                            .font(.headline)
                    }
                    if let iconCode = weatherData.wData?.daily.weather_code[idx] {
                        Image(systemName: weatherData.weatherImageName(weatherCode: iconCode))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        } else {
                                            Image(systemName: "questionmark")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                        }
                        Text(String(weatherData.wData?.daily.temperature_2m_max[idx] ?? 0.0))
                            .font(.title)
                    }
                    .frame(width: 100, height: 200)
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                }
                    
                
               
            }.padding(.horizontal, 60)
        }
    }
}

struct sevenDayView_Previews: PreviewProvider {
    static var previews: some View {
        sevenDayView()
    }
}
