//
//  NewsService.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import Foundation

struct NewsService {
    func loadHeadlineArticles(onCompletion: @escaping ([Article]) -> Void) {
        DataLoader().getHeadlineArticles { onCompletion($0.articles) }
    }
    
    func loadRecentArticles(onCompletion: @escaping ([Article]) -> Void) {
        DataLoader().getRecentArticles { onCompletion($0.articles) }
    }
}
