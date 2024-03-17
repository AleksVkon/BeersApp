//
//  DetailsViewController.swift
//  BeersApp
//
//  Created by Aleksey Konchyts on 17.03.24.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
//        fetchImage()
    }
    
//    private func fetchImage() {
//        URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, (any Error)?) -> Void#>)
//    }.resume()
    
}
