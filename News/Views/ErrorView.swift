//
//  ErrorView.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import SwiftUI

struct ErrorView: View {
	
	typealias ErrorViewActionHandler = () -> Void

	let error: Error
	let handler: ErrorViewActionHandler
	
	internal init(error: Error,
				  // @escaping to use the handler outside of the current scope
					handler: @escaping ErrorView.ErrorViewActionHandler) {
		self.error = error
		self.handler = handler
	}
	
    var body: some View {
		VStack {
			Image(systemName: "exclamationmark.icloud.fill")
				.foregroundColor(.gray)
				.font(.system(size: 50, weight: .heavy))
				.padding()
			Text("Oooopss")
				.foregroundColor(.black)
				.font(.system(size: 30, weight: .heavy))
				.multilineTextAlignment(.center)
				.padding(.bottom, 10)
			
			Text(error.localizedDescription)
				.foregroundColor(.gray)
				.font(.system(size: 15))
				.multilineTextAlignment(.center)
				.padding(.bottom, 20)
			Button.init(action: {
				handler()
			}, label: {
				Text("Retry")
			})
			.padding(.vertical, 12)
			.padding(.horizontal, 30)
			.background(Color.blue)
			.foregroundColor(.white)
			.font(.system(size: 15, weight: .heavy))
			.cornerRadius(10)
		}
	}
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
		ErrorView(error: APIError.decodingError) {}
			.previewLayout(.sizeThatFits)
    }
}
