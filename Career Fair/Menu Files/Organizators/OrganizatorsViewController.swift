//
//  OrganizatorsViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/7/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class OrganizatorsViewController: UIViewController{

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var collVIew: UICollectionView!
    
    var organizer = [Organizer]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Организаторы"
        
        getOrganizerData {
            self.collVIew.reloadData()
        }

    }
    
    func getOrganizerData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/organizer")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.organizer = try JSONDecoder().decode([Organizer].self, from: data!)
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

extension OrganizatorsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return organizer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "organizatorsCell", for: indexPath) as! OrgCollectionViewCell
    
        let urlString = organizer[indexPath.row].logo_url
        let url = URL(string: urlString)
        
        cell.image.downloadedFrom(url: url!)
        cell.image.applyStylesToImage()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailLabel.text = organizer[indexPath.row].description
        
    }
}
