//
//  TopView.swift
//  Lab1.2
//
//  Created by User on 2023-11-23.
//

import SwiftUI

struct topView: View {
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    var body: some View {
        VStack {
            Form {
                        Section(header: Text("Location")) {
                            TextField("Latitude", text: $latitude)
                                .keyboardType(.numbersAndPunctuation)
                            TextField("Longitude", text: $longitude)
                                .keyboardType(.numbersAndPunctuation)
                        }

                        Button("Submit") {
                            submitCoordinates()
                        }
                    }
                    .navigationBarTitle("Enter Coordinates")
            .font(.system(size: 40))
        }
    }
    func submitCoordinates() {
            // Validate and use the coordinates
            if let lat = Double(latitude), let lon = Double(longitude) {
                print("Latitude: \(lat), Longitude: \(lon)")
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
