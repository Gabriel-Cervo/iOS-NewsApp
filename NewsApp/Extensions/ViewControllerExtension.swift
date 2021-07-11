//
//  ViewControllerExtension.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import UIKit

//MARK: TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : recentArticles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Headline" : "Recent"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // Headline News
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlinesCell") as? HeadlineTableViewCell else { fatalError("Could not dequeue reusable cell for HeadlinesCell") }
            
            cell.configure(articles: headlineArticles ?? [])
            
            return cell
        }
        // Recent News
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlinesCell") else { fatalError("Could not dequeue reusable cell for RecentCell") }
        
        return cell
    }
}
