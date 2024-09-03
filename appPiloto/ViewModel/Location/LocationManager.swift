import CoreLocation
import SwiftUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
  
  static let shared = LocationManager()
  
  private let locationManager = CLLocationManager()
  var currentLocation: CLLocation?
  var authorizationStatus: CLAuthorizationStatus?
  
  
  override private init() {
      super.init()
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
  }

  func requestLocationAuthorization() {
      locationManager.requestWhenInUseAuthorization()
  }

  func requestLocation() {
    locationManager.requestLocation()
  }

  // Método delegado que se llama cuando la ubicación se actualiza
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard let newLocation = locations.last else { return }
      currentLocation = newLocation
  }

  // Método delegado para manejar errores al obtener la ubicación
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("Error al obtener la ubicación: \(error.localizedDescription)")
  }

  // Método delegado para cambios en el estado de autorización
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorizationStatus = status
  }
}
