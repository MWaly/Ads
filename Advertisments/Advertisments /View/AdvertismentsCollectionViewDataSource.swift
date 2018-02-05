//
//  AdvertismentsCollectionViewDataSource.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for data source of collection view of ads

import Foundation
import UIKit

final class AdvertismentsCollectionViewDataSource:NSObject, UICollectionViewDataSource {

    weak var delegate: AdvertismentsPresenterOutput? = nil

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfAds ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertismentCollectionViewCell", for: indexPath) as! AdvertismentUICollectionViewCell
        let ad = delegate?.ads[indexPath.row]
        cell.label.text = ad?.title
        guard let imageUrl = ad?.photo.computedURL else {
            return cell
        }
        cell.imageView.loadImageUsingCache(withUrl: imageUrl)

        return cell
    }

}
