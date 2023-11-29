//
//  ContentView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct ContentView: View {
    @State var weatherData = WeatherDataModel()
    
    var body: some View {
        ZStack {
            Image("sun-rays-cloudy-sky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    topView().environment(weatherData)
                    
                    Spacer()
                    
                    centerView().environment(weatherData)
                    
                    Spacer()
                    
                    sevenDayView().environment(weatherData)
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
    
}
