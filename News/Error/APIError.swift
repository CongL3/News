//
//  APIError.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import Foundation

enum APIError: Error {
	case decodingError
	case errorCode(Int)
	case unknown
}

extension APIError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .decodingError:
			return "Failed to decode from the service"
		case .errorCode(let code):
			return "failed with error :\(code)"
		case .unknown:
			return "unknown error occured"
		}		
	}
}
