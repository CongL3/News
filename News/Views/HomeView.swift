//
//  HomeView.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import SwiftUI

struct HomeView: View {

	@Environment(\.openURL) var openURL
	// When we leave the app the state is mantained in memory
	@StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
	
    var body: some View {

		Group {
			
			switch viewModel.state {
			case .loading:
				ProgressView()
			case .failure(let error):
				ErrorView(error: error, handler: viewModel.getArticles)
			case .success(let articles):
				NavigationView {
					List(articles) { item in
						ArticleView(article: item)
							.onTapGesture {
								load(url: item.url)
							}
					}
					.navigationTitle(Text("News"))
				}
			}
						
		}.onAppear(perform: viewModel.getArticles)
	}
	
	func load(url: String?) {
		
		guard let link = url,
		   let url = URL(string: link) else { return }
		
		openURL(url)
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
