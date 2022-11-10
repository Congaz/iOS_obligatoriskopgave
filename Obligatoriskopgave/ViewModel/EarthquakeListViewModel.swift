//
//  ViewModel.swift
//  PersistenceBruus
//
//  Created by dmu mac 26 on 27/10/2022.
//

import Foundation
import MapKit

class EarthquakeListViewModel: ObservableObject {
    @Published var earthquakes: [Earthquake] = []
    
    func fetchEarthquakes(_ timeSpan: EarthquakeTimeSpan) async {
        do {
            let tmp = try await NetworkService.fetchEarthquakes(timeSpan)
            // Update earthquakes array in main thread (instead of background task)
            DispatchQueue.main.async {
                // Sort by magnitude
                self.earthquakes = tmp.sorted(by: { e1, e2 in
                    e1.properties.mag < e2.properties.mag
                })
            }
        } catch {
            print(error)
        }
    }
}
