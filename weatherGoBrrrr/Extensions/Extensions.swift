//
//  Extensions.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import Foundation
import SwiftUI

extension Double {
	
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
	
	func roundDouble() -> String {
		return String(format: "%.0f", self)
	}
}

// Extension for adding rounded corners to specific corners
extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corners: corners) )
	}
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}

/*
 This code defines a SwiftUI extension that allows developers to create custom rounded corners for views. Let me break it down:

 1. The first block is an extension to the `View` protocol in SwiftUI that adds a new method called `customCornerRadius`:
 ```swift
 extension View {
	 func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		 clipShape(RoundedRectangle(cornerRadius: radius))
	 }
 }
 ```
 This method accepts a radius value and specific corners to round, then returns a view with those corners rounded by applying a clip shape.

 2. The second block defines a custom `RoundedCorner` shape:
 ```swift
 struct RoundedCorner: Shape {
	 var radius: CGFloat = .infinity
	 var corners: UIRectCorner = .allCorners
	 
	 func path(in rect: CGRect) -> Path {
		 let path = UIBezierPath(
			 roundedRect: rect,
			 byRoundingCorners: corners,
			 cornerRadii: CGSize(width: radius, height: radius)
		 )
		 return Path(path.cgPath)
	 }
 }
 ```

 However, there's a discrepancy in the code. The `customCornerRadius` method is using `RoundedRectangle` (a built-in SwiftUI shape), which will round all corners equally, not just the specified corners. The `RoundedCorner` custom shape you've defined (which supports selecting specific corners) isn't actually being used in the extension.

 For this code to work as intended (rounding only specific corners), the extension should be modified to use the custom `RoundedCorner` shape:

 ```swift
 extension View {
	 func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		 clipShape(RoundedCorner(radius: radius, corners: corners))
	 }
 }
 ```

 With this correction, the code would allow you to round specific corners of a view in SwiftUI, which is useful for custom UI elements like cards with only certain corners rounded.
 
*/
