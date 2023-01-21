//
//  ContentView.swift
//  CuWeather
//
//  Created by Gabriel Puppi on 18/01/23.
//

import SwiftUI


struct ContentView: View {
    
   @StateObject var viewModel = CurrentLocationViewModel()
    
    
    var body: some View {
        VStack {
            Button("Fetch weather") {
                viewModel.fetchCurrentLocationForecast()
            }
        }.onAppear{
            viewModel.updateCurrentLocation()
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
