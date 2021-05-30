//
//  NewsResponse.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
	let articles: [Article]
}

// MARK: - Article

// Made them all optionals as in the event the API does not send the data back the app does not crash
struct Article: Codable, Identifiable {
	let id = UUID()
	let author: String?
	let url: String?
	let source, title, articleDescription: String?
	let image: String?
	let date: Date?
	
	enum CodingKeys: String, CodingKey {
		case author, url, source, title
		case articleDescription = "description"
		case image, date
	}
}


extension Article {
	static var dummyData: Article {
		.init(author: "Ken Martin",
			  url: "https://www.foxbusiness.com/lifestyle/american-airlines-joins-southwest-in-delaying-alcoholic-beverage-sales-due-to-bad-passenger-behavior",
			  source: "Fox Business",
			  title: "American Airlines joins Southwest in delaying alcoholic beverage sales as passenger violence rises - Fox Business",
			  articleDescription: "It's going to be a dry summer on American Airlines flights this summer.",
			  image: "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2021/05/0/0/flight-attendant.jpg?ve=1&tl=1",
			  date: Date())
	}
}
