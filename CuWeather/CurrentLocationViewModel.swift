
import Foundation
import SwiftUI
import Combine


class CurrentLocationViewModel: ObservableObject {
    
    
    var userCoordinates: [Double] = [0, 0]
    
    let locationService = LocationManager()
    
    let networkService = CurrentLocationNetworkService()
    
    
    
    func updateCurrentLocation() {
        userCoordinates[0] = locationService.locationManager.location?.coordinate.latitude ?? 0
        userCoordinates[1] = locationService.locationManager.location?.coordinate.longitude ?? 0
      
    }
    
    
    func fetchCurrentLocationWeather() {
        networkService.getCurrentLocationWeather(lat: userCoordinates[0], lon: userCoordinates[1]) { result in
            switch result {
            case .success(let apiData):
                print("It worked!")
                DispatchQueue.main.async {
//                    self.books = apiData.books
                    print(apiData.weather)
                }
            case .failure(ApiError.custom(let message)):
                print("API CUSTOM ERROR", message)
            case .failure(let error):
                print("vish", error)
            }
        }
   }
    
    func fetchCurrentLocationForecast() {
        print(CurrentLocationEndpoint.onecall(userCoordinates[0], userCoordinates[1], "minutely"))
        networkService.getCurrentLocationForecast(lat: userCoordinates[0], lon: userCoordinates[1], exclude: "minutely") { result in
            switch result {
            case .success(let apiData):
                print("It worked!")
                DispatchQueue.main.async {

                    print(apiData.hourly)
               
                }
            case .failure(ApiError.custom(let message)):
                print("API CUSTOM ERROR", message)
            case .failure(let error):
                print("vish", error)
            }
        }
        
        
        
    }
    
    
    
    

    
    
    
    
    
}
