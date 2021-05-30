//
//  ArticleView.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
	
	let article: Article
	
	var body: some View {
		
		HStack {
			if let imgUrl = article.image,
			   let url = URL(string: imgUrl) {
//				URLImage.init(url: url,
//							  options:
//								URLImageOptions(identifier: article.id.uuidString,
//												cachePolicy: .returnCacheElseLoad(
//													cacheDelay: nil, downloadDelay:0.25)),
//							  content: { image in
//								image
//									.resizable()
//									.aspectRatio(contentMode: .fill)
//							  })
				URLImage(url) {
					// This view is displayed before download starts
					EmptyView()
				} inProgress: { progress in
					// Display progress
					Text("Loading...")
				} failure: { error, retry in
					// Display error and retry button
					VStack {
						PlaceholderImageView()
						Text(error.localizedDescription)
						Button("Retry", action: retry)
					}
				} content: { image in
					// Downloaded image
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
				}
				.frame(width: 100, height: 100)
				.cornerRadius(10)
				
			} else {
				PlaceholderImageView()
			}
			
			VStack(alignment: .leading, spacing: 4) {
				Text(article.title ?? "")
					.foregroundColor(.black)
					.font(.system(size: 18, weight: .semibold))
				
				Text(article.source ?? "N/A")
					.foregroundColor(Color.gray)
					.font(.footnote)
			}
		}
	}
}

struct PlaceholderImageView: View {
	var body: some View {
		return Image(systemName: "photo.fill")
			.foregroundColor(.white)
			.background(Color.gray)
			.frame(width: 100, height: 100)

	}
}

struct ArticleView_Previews: PreviewProvider {
	static var previews: some View {
		ArticleView(article: Article.dummyData)
			.previewLayout(.sizeThatFits)
	}
}
