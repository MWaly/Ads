//
//  AdvertisementUICollectionViewCell.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for content views of a collection view cell

import UIKit

final class AdvertismentUICollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = ""
        imageView.image = UIImage(named: "placeholder")
    }

}
