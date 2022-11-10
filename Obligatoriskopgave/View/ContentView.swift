//
//  ContentView.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: EarthquakeListViewModel
    
    var body: some View {
        TabView {
            EarthquakeListView("Hour")
                .tabItem {
                    Label("Hour", systemImage: "list.dash")
                }
                .task {
                    await viewModel.fetchEarthquakes(EarthquakeTimeSpan.Hour)
                }
            EarthquakeListView("Day")
                .tabItem {
                    Label("Day", systemImage: "list.dash")
                }
                .task {
                    await viewModel.fetchEarthquakes(EarthquakeTimeSpan.Day)
                }
            EarthquakeListView("Week")
                .tabItem {
                    Label("Week", systemImage: "list.dash")
                }
                .task {
                    await viewModel.fetchEarthquakes(EarthquakeTimeSpan.Week)
                }
            EarthquakeListView("Month")
                .tabItem {
                    Label("Month", systemImage: "list.dash")
                }
                .task {
                    await viewModel.fetchEarthquakes(EarthquakeTimeSpan.Month)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
