//
//  ForecastWeather.swift
//  CuWeather
//
//  Created by Gabriel Puppi on 21/01/23.
//

import Foundation


struct Forecast: Decodable, Identifiable{
    
    let id = UUID()
    let hourly: [Hourly]
    
    enum CodingKeys: String, CodingKey {
         case hourly = "hourly"
     }
    
}

struct Hourly: Decodable, Identifiable {
    
    let id = UUID()
    let date: Double
    let temp: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp = "temp"
        case weather = "weather"
        
    }
    
}


