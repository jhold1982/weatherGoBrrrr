//
//  ContentView.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - Properties
	// is @StateObject so the view can be notified everytime @Published variables are updated
	@StateObject var locationManager = LocationManager()
	@State var weather: ResponseBody?
	var weatherManager = WeatherManager()
	
	
	// MARK: - View Body
    var body: some View {
		
        VStack {
			// testing location coordinate fetch
			if let location = locationManager.location {
				
				if let weather = weather {
					WeatherView(weather: weather)
				} else {
					LoadingView()
						.task {
							do {
								weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
							} catch {
								print("Error fetching weather: \(error)")
							}
						}
				}
			} else {
				if locationManager.isLoading {
					LoadingView()
				} else {
					WelcomeView()
						.environmentObject(locationManager)
				}
			}
			
        }
        .padding()
		.background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
		.preferredColorScheme(.dark)
    }
	
	// MARK: - Functions
	/// This is an empty function. It does NOTHING
	func emptyFunc() {
		// Intentionally Left Blank
	}
}

#Preview {
    ContentView()
}
