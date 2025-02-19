//
//  LoadingView.swift
//  weatherGoBrrrr
//
//  Created by Justin Hold on 2/19/25.
//

import SwiftUI

struct LoadingView: View {
	
	// MARK: - Properties
	
	
	
	// MARK: - View Body
    var body: some View {
        
		ProgressView()
			.progressViewStyle(CircularProgressViewStyle(tint: .white))
			.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	
	// MARK: - Functions
}

#Preview {
    LoadingView()
}
