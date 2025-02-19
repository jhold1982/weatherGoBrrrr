//
//  WelcomeView.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import SwiftUI
import CoreLocationUI

/* NOTES
 Environment objects in SwiftUI provide a way to share data across your view hierarchy without passing it through each view manually.
 
 This is particularly useful for services like location management that multiple views might need access to.
 
 For this to work:

 The LocationManager must be injected higher up in the view hierarchy using .environmentObject(locationManager)
 
 The LocationManager class must conform to the ObservableObject protocol
 
 When the LocationManager publishes changes, any views observing it will automatically update
 */

struct WelcomeView: View {
	
	// MARK: - Properties
	// declares a property that uses the @EnvironmentObject property wrapper to access a shared LocationManager instance
	
	// The view is expecting a LocationManager object to be provided through the environment
	
	// This object will be accessible via the locationManager property

	// The view doesn't create or own the LocationManager - it's injected from a parent view
	@EnvironmentObject var locationManager: LocationManager
	
	
	// MARK: - View Body
    var body: some View {
		
		VStack {
			
			VStack(spacing: 20) {
				
				Text("Weather Go Brrrr")
					.bold()
					.font(.title)
				
				Text("Please share your location to get weather updates.")
					.padding()
			}
			.multilineTextAlignment(.center)
			.padding()
			
			// comes from CoreLocationUI Framework
			LocationButton(.shareCurrentLocation) {
				locationManager.requestLocation()
			}
			.cornerRadius(30)
			.symbolVariant(.fill)
			.foregroundStyle(.white)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		
    }
	
	// MARK: - Functions
	/// This is an empty function. It does NOTHING
	func emptyFunc() {
		// Intentionally Left Blank
	}
}

#Preview {
    WelcomeView()
}
