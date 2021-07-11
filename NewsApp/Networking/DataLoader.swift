//
//  DataLoader.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import Foundation

struct DataLoader {
    var networking = Networking()
    
    func getHeadlineArticles(completionHandler: @escaping (DataModel) -> Void) {
        networking.getData(for: Constants.headlinesURL, completionHandler: completionHandler)
    }
    
    func getRecentArticles(completionHandler: @escaping (DataModel) -> Void) {
        networking.getData(for: Constants.recentsURL, completionHandler: completionHandler)
    }
}
