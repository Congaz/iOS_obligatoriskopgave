//
//  ObligatoriskopgaveApp.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI

@main
struct ObligatoriskopgaveApp: App {
    var body: some Scene {
        WindowGroup {
            // Make instance of view model globally available.
            ContentView()
                .environmentObject(EarthquakeListViewModel())
                .environmentObject(EarthquakeMapViewModel())
        }
    }
}
