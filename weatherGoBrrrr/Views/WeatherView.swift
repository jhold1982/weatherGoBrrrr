//
//  WeatherView.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import SwiftUI

struct WeatherView: View {
	
	// MARK: - Properties
	var weather: ResponseBody
	
	
	// MARK: - View Body
    var body: some View {
		ZStack(alignment: .leading) {
			
			VStack {
				VStack(alignment: .leading, spacing: 5) {
					Text(weather.name)
						.font(.title)
						.bold()
					
					Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
						.fontWeight(.light)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				
				Spacer()
				
				VStack {
					HStack {
						Text(weather.main.feelsLike.roundDouble() + "°")
							.font(.system(size: 100))
							.fontWeight(.bold)
							.padding()
					}
				}
				.frame(maxWidth: .infinity)
				
			}
			.padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			
		}
		.ignoresSafeArea(edges: .bottom)
		.background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
		.preferredColorScheme(.dark)
    }
	
	
	// MARK: - Functions
	
}

#Preview {
	WeatherView(weather: previewWeather)
}
