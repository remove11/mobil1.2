//
//  7dayView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct DailyWeather {
    var day: String
    var icon: String
    var temperature: String
}

struct sevenDayView: View {
    // Fyll denna med 7 dagars data
    let weekWeather: [DailyWeather] = [
        DailyWeather(day: "Mon", icon: "sun.max.fill", temperature: "17°"),
        DailyWeather(day: "Tue", icon: "cloud.rain.fill", temperature: "15°"),
        DailyWeather(day: "Wed", icon: "cloud.sun.fill", temperature: "18°"),
        DailyWeather(day: "Thu", icon: "wind", temperature: "11°"),
        DailyWeather(day: "Fri", icon: "snow", temperature: "3°"),
        DailyWeather(day: "Sat", icon: "sunset.fill", temperature: "10°"),
        DailyWeather(day: "Sun", icon: "cloud.bolt.rain.fill", temperature: "9°")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(weekWeather, id: \.day) { weather in
                    VStack {
                        Text(weather.day)
                            .font(.headline)
                        Image(systemName: weather.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text(weather.temperature)
                            .font(.title)
                    }
                    .frame(width: 100, height: 200)
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(40)
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
