//
//  WeatherRow.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/20/25.
//

import SwiftUI

struct WeatherRow: View {
	
	// MARK: - Properties
	var logo: String
	var name: String
	var value: String
	
	// MARK: - View Body
    var body: some View {
        
		HStack(spacing: 20) {
			Image(systemName: logo)
				.font(.title2)
				.frame(width: 20, height: 20)
				.padding()
				.background(Color(hue: 1, saturation: 0.0, brightness: 0.888))
				.cornerRadius(50)
			
			VStack(alignment: .leading, spacing: 0) {
				Text(name)
					.font(.caption)
				Text(value)
					.font(.title)
					.bold()
			}
		}
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
}
