//
//  ContentView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        ZStack {
            Image("sun-rays-cloudy-sky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    topView()
                    
                    Spacer()
                    
                    centerView()
                    
                    Spacer()
                    
                    sevenDayView()
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
    
}
