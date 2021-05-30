//
//  ResultState.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import Foundation

enum ResultState {
	case loading
	case success(content: [Article])
	case failure(error: Error)
}
