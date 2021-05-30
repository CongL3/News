//
//  NewsEndpoint.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import Foundation

protocol APIBuilder {
	var urlRequest: URLRequest { get }
	var baseUrl: URL { get }
	var path: String { get }

}

enum NewsAPI {
	case getNews
}

extension NewsAPI: APIBuilder {
	var urlRequest: URLRequest {
		switch self {
		case .getNews:
			return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
		}
	}
	
	var baseUrl: URL {
		return URL(string: "https://api.lil.software")!
	}
	
	var path: String {
		return "/news"
	}
	
	
}
