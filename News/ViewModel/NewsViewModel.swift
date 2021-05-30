//
//  NewsViewModel.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import Foundation
import Combine

protocol NewsViewModel {
	func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
	
	private let service: NewsService
	
	// private set is pulic getting and private setter
	private(set) var articles = [Article]()
	// It is required to have a set of cancellables or the api request might not get called
	private var cancellables = Set<AnyCancellable>()
	
	@Published private(set) var state: ResultState = .loading
	
	init(service: NewsService) {
		self.service = service
	}
	
	func getArticles() {
		
		self.state = .loading
		
		let canncellable = service
			.request(from: .getNews)
			// sink allows us to listen to the success or failure
			// and allows us to listen to when it finishes (publishing)
			.sink { res in
				switch res {
				
				case .finished:
					self.state = .success(content: self.articles)
					 // send back the articles
				case .failure(let error):
					// send back the failures
					self.state = .failure(error: error)
				}
			}
			// when the request finishes we wanna set the data
			receiveValue: { response in
				self.articles = response.articles
			}
		
		self.cancellables.insert(canncellable)

	}
}
