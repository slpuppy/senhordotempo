//
//  CurrentWeather.swift
//  CuWeather
//
//  Created by Gabriel Puppi on 19/01/23.
//

import Foundation


struct CurrentWeather: Decodable, Identifiable {
    
    
    let id = UUID()
    let weather: [Weather]
    
   enum CodingKeys: String, CodingKey {
        case weather = "weather"
    }
    
    
}

struct Weather: Decodable, Identifiable {
    
    let id = UUID()
    let main: String
    let description: String
    
    
    enum CodingKeys: String, CodingKey {
         case main = "main"
         case description = "description"
     }
    
    
}
