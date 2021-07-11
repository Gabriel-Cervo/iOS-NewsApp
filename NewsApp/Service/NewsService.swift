//
//  NewsService.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import Foundation

final class NewsService {
    private var headlineArticles: DataModel?
    private var recentArticles: DataModel?
    
    init() {
        loadData()
    }
    
    private func loadData() {
        DataLoader().getHeadlineArticles { [weak self] data in
            self?.headlineArticles = data
        }
    }
    
    func loadHeadlineArticles() -> [Article] {
        headlineArticles?.articles ?? []
    }
    
    func loadRecentArticles() -> [Article] {
        recentArticles?.articles ?? []
    }
}
