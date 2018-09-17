//
//  PartnersViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/17/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class PartnersViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var detailLabel: UITextView!
    
    var partners = [Partners]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Партнеры и Медиа-партнеры"

        getPartnersData {
            self.collView.reloadData()
        }
    }
    
    func getPartnersData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/partner")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.partners = try JSONDecoder().decode([Partners].self, from: data!)
                DispatchQueue.main.async {
                    completed()
                }
            }
            catch let e{
                print(e)
            }
        }
    }
}

extension PartnersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "partnersCell", for: indexPath) as! PartnersCollectionViewCell
        
        let urlString = partners[indexPath.row].logo_url
        let url = URL(string: urlString)
        
        cell.image.downloadedFrom(url: url!)
        cell.image.applyStylesToImage()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailLabel.text = partners[indexPath.row].description
    }
}

