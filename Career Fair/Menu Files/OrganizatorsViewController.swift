//
//  OrganizatorsViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/7/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class OrganizatorsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrgCollectionViewCell
        
        cell.image.applyStylesToImage()
        return cell
        
    }
    


}
