import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        startIfAuthorized()
   }
    
    func startIfAuthorized(){
        
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
                case .notDetermined, .restricted, .denied:
                    print("No access")
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                DispatchQueue.main.async {
                    self.locationManager.startUpdatingLocation()
                }
                
                @unknown default:
                    break
            }
        } else {
            print("Location services are not enabled")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        //        print("user latitude = \(userLocation.coordinate.latitude)")
        //        print("user longitude = \(userLocation.coordinate.longitude)")
        
        
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
//                print(placemark.locality!)
//                print(placemark.administrativeArea!)
//                print(placemark.country!)
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    
}
