//
//  ModelData.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
	
	let data: Data
	
	guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
		fatalError("Couldn't find \(filename) in main bundle.")
	}
	
	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle.:\n\(error)")
	}
	
	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	} catch {
		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}

/* This function load<T: Decodable> is a generic utility function designed to load and decode JSON data from a file in your app's main bundle. Here's what it does step by step:
 
 It takes a filename as a parameter and returns a decoded object of type T (which must conform to the Decodable protocol)
 It attempts to locate the specified file in the app's main bundle:

 Bundle.main.url(forResource:withExtension:) looks for the file
 withExtension: nil means the filename parameter should include the extension
 If the file isn't found, it crashes with a descriptive error message

 It tries to load the file contents into a Data object:

 If loading fails, it crashes with details about the error

 It attempts to decode the data into the requested type T:

 Creates a JSONDecoder instance
 Tries to decode the data into type T
 If decoding fails, it crashes with information about the parsing error

 This function is commonly used in SwiftUI apps to load local JSON data files for things like sample data, configuration, or offline content. It uses a forceful approach with fatalError() calls because it's designed for scenarios where these files are essential for the app to function.
 */
