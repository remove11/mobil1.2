//
//  NetworkManager.swift
//  Lab1.2
//
//  Created by User on 2023-11-29.
//

import Foundation

import SwiftUI
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    @Published var isConnected = false

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    
}
