
import Foundation

class CurrentLocationNetworkService: URLSession {
    
    let session = URLSession.shared
    
    func getCurrentLocationWeather(lat: Double, lon: Double, completion: @escaping (Result<CurrentWeather, Error >) -> ()) {
        session.dataTask(CurrentWeather.self, endpoint: CurrentLocationEndpoint.weather(lat, lon), completion: completion).resume()
    }
    
    func getCurrentLocationForecast(lat: Double, lon: Double, exclude: String, completion: @escaping (Result<Forecast, Error>) -> ()) {
        session.dataTask(Forecast.self, endpoint: CurrentLocationEndpoint.onecall(lat, lon, exclude), completion: completion).resume()
    }
}

