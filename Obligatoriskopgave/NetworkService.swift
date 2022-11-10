//
//  NetworkService.swift
//  RandomUsers
//
//  Created by dmu mac 26 on 06/10/2022.
//

import Foundation

class NetworkService {
    static func fetchEarthquakes(_ timeSpan: EarthquakeTimeSpan) async throws -> [Earthquake] {
        var jsonObj: [Earthquake] = []
        if let url = URL(string: timeSpan.rawValue) {
            // _ = parameter is unused.
            let (data, _) = try await URLSession.shared.data(from: url)
            // Istanciate decoder
            let jsonDecoder = JSONDecoder()
            // Set source date format (millisecondsSince1970 UTC)
            jsonDecoder.dateDecodingStrategy = .millisecondsSince1970 // Expects UTC.
            jsonObj = try jsonDecoder.decode(Wrapper.self, from: data).features
        }
        else {
            throw NetworkServiceError.invalidArgumentException
        }
        return jsonObj
    }
}

enum EarthquakeTimeSpan: String {
    case Hour = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
    case Day = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
    case Week = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"
    case Month = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
}


