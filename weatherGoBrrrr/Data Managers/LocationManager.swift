//
//  LocationManager.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
	
	// variable for grabbing users location, is optional in case user denies access
	@Published var location: CLLocationCoordinate2D?
	// variable for loading state, is either true or false
	@Published var isLoading: Bool = false
	
	// delcare instance of CLLocationManager() as "manager" constant
	let manager = CLLocationManager()
	
	// initializer
	override init() {
		super.init()
		manager.delegate = self
	}
	
	/// Function to handle requesting users location
	func requestLocation() {
		isLoading = true
		manager.requestLocation()
	}
	
	// Stub 1 to make CLLocationManager work
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		location = locations.first?.coordinate
		isLoading = false
	}
	
	// Stub 2 to make CLLocationManager work, handles errors
	func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
		print("Error fetching location", error)
		isLoading = false
	}
}
