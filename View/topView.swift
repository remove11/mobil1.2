//
//  TopView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct topView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            if viewModel.locationData.isEmpty {
                Text("Loading Location...")
                    .font(.system(size: 40))
            } else {
                Text(firstWord(of: viewModel.locationData.first?.display_name ?? "Unknown Location"))
                    .font(.system(size: 40))
            }
        }
        .onAppear {
            viewModel.fetchLocation()
        }
    }
     func firstWord(of string: String) -> String {
             return string.components(separatedBy: ",").first ?? string
         }
}

#Preview {
    topView()
}
