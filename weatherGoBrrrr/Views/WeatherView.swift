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
						VStack(spacing: 20) {
							Image(systemName: "sun.max")
								.font(.system(size: 40))
							Text(weather.weather[0].main)
						}
						.frame(width: 150, alignment: .leading)
						Spacer()
						Text(weather.main.feelsLike.roundDouble() + "°")
							.font(.system(size: 100))
							.fontWeight(.bold)
							.padding()
					}
					
					Spacer()
						.frame(height: 80)
					
					AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
						image
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 350)
					} placeholder: {
						ProgressView()
					}
					Spacer()
				}
				.frame(maxWidth: .infinity)
			}
			.padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			
			VStack {
				Spacer()
				VStack(alignment: .leading, spacing: 20) {
					Text("Weather Now")
						.bold()
						.padding(.bottom)
					
					HStack {
						WeatherRow(
							logo: "thermometer",
							name: "Min Temp",
							value: weather.main.tempMin.roundDouble() + "°"
						)
						Spacer()
						WeatherRow(
							logo: "thermometer.high",
							name: "Max Temp",
							value: weather.main.tempMax.roundDouble() + "°"
						)
					}
					
					HStack {
						WeatherRow(
							logo: "wind",
							name: "Wind Speed",
							value: weather.wind.speed.roundDouble() + " m/s"
						)
						Spacer()
						WeatherRow(
							logo: "humidity.fill",
							name: "Humidity",
							value: weather.main.humidity.roundDouble() + "%"
						)
					}
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
//				.padding(.bottom, 20)
				.foregroundStyle(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
				.background(.white)
				.cornerRadius(20, corners: [.topLeft, .topRight])
			}
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
