//
//  Extensions.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import Foundation

extension Double {
	
	func roundDouble() -> String {
		return String(format: "%.0f", self)
	}
}

/*
 This code is creating an extension for the Double type in Swift.
 The extension adds a new method called roundDouble() to all Double values. This method:

 Takes no parameters
 Returns a String
 Formats the Double value as a string with no decimal places

 The String(format: "%.0f", self) part uses C-style string formatting:

 %.0f is the format specifier that means "floating point number with 0 decimal places"
 self refers to the Double value the method is called on

 This extension would be used like this:
 let temperature = 72.6
 let rounded = temperature.roundDouble() // Returns "73"
 
 The purpose of this extension is to provide a convenient way to display Double values as whole numbers without decimal places.
 This is commonly used in UI code when you want to show simplified numeric values.
 */
