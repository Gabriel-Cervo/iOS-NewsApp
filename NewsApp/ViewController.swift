//
//  ViewController.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 10/07/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let service = NewsService()
    var headlineArticles: [Article]?
    var recentArticles: [Article]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
        
        let headlinesNib = UINib(nibName: "HeadlinesCell", bundle: nil)
        self.tableView.register(headlinesNib, forCellReuseIdentifier: "HeadlinesCell")
    }
    
    private func loadArticles() {
        service.loadHeadlineArticles { [weak self] headlineArticles in
            self?.headlineArticles = headlineArticles
        }
        
        service.loadRecentArticles { [weak self] recentArticles in
            self?.recentArticles = recentArticles
        }
    }
}

