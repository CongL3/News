//
//  NewsApp.swift
//  News
//
//  Created by Cong Le on 30/05/2021.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct NewsApp: App {
    var body: some Scene {
		let urlImageService = URLImageService(fileStore: URLImageFileStore(),
											  inMemoryStore: URLImageInMemoryStore())

        WindowGroup {
			HomeView()
				.environment(\.urlImageOptions, URLImageOptions(
					maxPixelSize: CGSize(width: 600.0, height: 600.0)
				))
				.environment(\.urlImageService, urlImageService)
        }
    }
}
