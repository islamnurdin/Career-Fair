//
//  OrganizatorsViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/7/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class OrganizatorsViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension OrganizatorsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "organizatorsCell", for: indexPath) as! OrgCollectionViewCell
        
        cell.image.applyStylesToImage()
        return cell
    }

}
