import Foundation


enum CurrentLocationEndpoint: ApiEndpoint {
    
    case weather(Double, Double), onecall(Double, Double, String)
    
    var path: String {
        switch self {
        case .weather:
            return "weather"
        case .onecall:
            return "onecall"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case let .weather(lat, lon):
            return ["lat": String(lat), "lon": String(lon), "appid" : "d58a8d6342c4dbaa379ca5ee72074692"]
        case let .onecall(lat, lon, exclude):
            return ["lat" : String(lat), "lon": String(lon), "exclude" : String(exclude), "appid" : "d58a8d6342c4dbaa379ca5ee72074692"]
        }
    }
   
    var method: HTTPMethod {
        switch self {
            
        case let .weather(lat, lon):
            return .get
        case let .onecall(lat, lon, exclude):
            return .get
        }
    }
}




