//
//  HeadlineTableViewCell.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var articles: [Article]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.showsHorizontalScrollIndicator = false
        let cellNib = UINib(nibName: "HeadlineCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func configure(articles: [Article]) {
        self.articles = articles
        self.collectionView.reloadData()
    }
}
