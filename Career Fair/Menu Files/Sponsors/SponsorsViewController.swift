//
//  SponsorsViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/17/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class SponsorsViewController: UIViewController {

    @IBOutlet weak var detailLable: UITextView!
    @IBOutlet weak var collView: UICollectionView!

    var sponsors = [Sponsors]()
    override func viewDidLoad() {
        super.viewDidLoad()

        getSponsorsData {
            self.collView.reloadData()
        }
    }
    
    func getSponsorsData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/sponsor")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.sponsors = try JSONDecoder().decode([Sponsors].self, from: data!)
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


extension SponsorsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sponsorsCell", for: indexPath) as! SponsorsCollectionViewCell
        
        let urlString = sponsors[indexPath.row].logo_url
        let url = URL(string: urlString)
        
        cell.image.downloadedFrom(url: url!)
        cell.image.applyStylesToImage()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailLable.text = sponsors[indexPath.row].description
        if let cell = collectionView.cellForItem(at: indexPath) as? SponsorsCollectionViewCell {
            cell.image.addShadowBottom()
        }
    }
}

