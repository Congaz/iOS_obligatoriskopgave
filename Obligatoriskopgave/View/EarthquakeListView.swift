//
//  ContentView.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI

struct EarthquakeListView: View {
    @State var title: String
    @EnvironmentObject var viewModel: EarthquakeListViewModel

    init(_ title: String) {
        self.title = title
        UIBarButtonItem.appearance().tintColor = .black
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.earthquakes) { e in
                NavigationLink(destination: EarthquakeMapView(earthquake: e)) {
                    Label("Icon Only", systemImage: "globe")
                        .font(.system(size: 40))
                        .labelStyle(.iconOnly)
                    Text(String(format: "%.2f", e.properties.mag))
                        .font(.system(size: 25))
                    VStack(alignment: .leading) {
                        Text(dateToString(e.properties.time))
                        Text(e.properties.place)
                            .font(Font.body.bold())
                    }
                }
                .navigationTitle("Earthquakes: " + title)
                .listRowBackground(Color.yellow)
                .listRowInsets(.init(top: 15, leading: 15, bottom: 15, trailing: 15))
                //.padding(.bottom, 100)
                //.listRowInsets(EdgeInsets(.init(top: 15, leading: 15, bottom: 30, trailing: 15)))
           }
        }
    
        
    }
    
    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "da_DK")
        dateFormatter.setLocalizedDateFormatFromTemplate("E, d MMM yyyy HH:mm")
        return dateFormatter.string(from: date)
    }
    
}

struct EarthquakeListView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeListView("goaway")
    }
}
