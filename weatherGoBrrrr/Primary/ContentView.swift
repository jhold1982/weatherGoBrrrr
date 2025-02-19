//
//  ContentView.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - Properties
	
	
	
	// MARK: - View Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
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
