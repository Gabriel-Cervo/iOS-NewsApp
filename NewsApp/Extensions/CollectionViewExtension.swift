//
//  CollectionViewExtension.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import UIKit
import Kingfisher

//MARK: CollectionView Methods
extension HeadlineTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Add spaces at the beginning and the end
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 270, height: 180)
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? HeadlineCollectionViewCell else { fatalError("Cannot dequeue the cell as HeadlineCollectionViewCell") }
        
        let currentArticle = articles?[indexPath.row]
        cell.articleTitle.text = currentArticle?.title ?? ""
        cell.articleDate.text = ""
        
        if let imageURL = URL(string: currentArticle?.urlToImage ?? "") {
            cell.imageView.kf.setImage(with: imageURL)
        }

        return cell
    }
}
