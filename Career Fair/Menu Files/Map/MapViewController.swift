//
//  MapViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/14/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var mapViewLeftConstraint: NSLayoutConstraint!
    
    private var map = MapMenu.mapList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Карта"
    }
}

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return map.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.cellId, for: indexPath) as! MapCollectionViewCell
        cell.backgroundColor = Colors.darkBlue
        cell.mapLabel.text = map[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mapViewLeftConstraint.constant = CGFloat(indexPath.item) * collectionView.frame.size.width / 5
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        mapImage.image = UIImage(named: map[indexPath.row].image)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / CGFloat(map.count), height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
