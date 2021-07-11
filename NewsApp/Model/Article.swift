//
//  Article.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import Foundation

struct Article: Decodable {
    let source: ArticleSource
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    var publishedDate: Date {
        guard let publishedAt = publishedAt else { return Date() }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Api response example -> 2021-07-11T03:00:00Z
        return dateFormatter.date(from: publishedAt) ?? Date()
    }
}
