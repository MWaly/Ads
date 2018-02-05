//
//  AdvertismentsViewController.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for view layer operations of Advertisments use case


import Foundation
import UIKit

final class AdvertismentsViewController: UIViewController, UICollectionViewDelegate {

    var ads = [Advertisment]()
    let dataSource = AdvertismentsCollectionViewDataSource()
    var presenter: AdvertismentsPresenterInput? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //MARK: View Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        dataSource.delegate = self
        presenter?.output = self
        presenter?.loadNewAdvertisments()
    }

}

// MARK: PRESENTER OUTPUT

extension AdvertismentsViewController: AdvertismentsPresenterOutput {

    func presentError(error: Error) {
        loadingLabel.text = "Error :\(error.localizedDescription)"
        activityIndicator.stopAnimating()
    }

    func startLoadingIndicator() {
        loadingLabel.text = "Loading Now New Items"
        activityIndicator.startAnimating()
    }

    func stopLoadingIndicator() {
        loadingLabel.text = "All Good Now"
        activityIndicator.stopAnimating()
    }

    func reload() {
        collectionView.reloadData()
    }

}
