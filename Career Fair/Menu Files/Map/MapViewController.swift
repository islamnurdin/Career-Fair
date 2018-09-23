//
//  MapViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/14/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class MapViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var floorCollectionView: UICollectionView!
   // @IBOutlet weak var employerCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var mapViewLeftConstraint: NSLayoutConstraint!
    
    private var map = MapMenu.mapList
    
    //var companies = [Employer]()
    //var companiesByFloor: [Int : [Employer]] = [:]
    //var floors = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Карта"
        
        //initCompanies()
//        getEmployerData {
//            self.employerCollectionView.reloadData()
//        }
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
        floorCollectionView.reloadData()
 
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapImage
    }

//    func initCompanies() {
//        let emp = Employer()
//        for i in 1...5 {
//            companiesByFloor[i] = [emp]
//        }
//    }
//
//    func getEmployerData(completed: @escaping () -> ()) {
//        let url = URL(string: "http://138.68.86.126/employer/")
//        Alamofire.request(url!).responseJSON { response in
//            let data = response.data
//            do {
//                self.companies = try JSONDecoder().decode([Employer].self, from: data!)
//                self.companiesByFloor = Dictionary(grouping: self.companies, by: {$0.floor})
//                self.floors = self.companiesByFloor.keys.sorted()
//
//                print("FFFFFd", self.floors)
//                print(self.companiesByFloor)
//                DispatchQueue.main.async {
//                    completed()
//                }
//            }
//            catch let e{
//                print(e)
//            }
//        }
//    }
}

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return floors.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.employerCollectionView{
//            let floor = floors[section]
//            return companiesByFloor[floor]!.count
//        }
//        else if collectionView == self.floorCollectionView{
            return map.count
//        }
//        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.cellId, for: indexPath) as! MapCollectionViewCell
            cell.backgroundColor = Colors.darkBlue
            cell.mapLabel.text = map[indexPath.row].title
            return cell
//        else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmployerCollectionViewCell.cellID, for: indexPath) as! EmployerCollectionViewCell
//
//            let floor = floors[indexPath.section]
//            let company = companiesByFloor[floor]![indexPath.item]
//            cell.companyDetails.text = company.description
//            cell.companyName.text = company.full_name
//            let urlString = company.logo_url
//            let url = URL(string: urlString)
//            if url != nil {
//                cell.companyImg.downloadedFrom(url: url!)
//            }
//            return cell
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mapViewLeftConstraint.constant = CGFloat(indexPath.item) * collectionView.frame.size.width / 5
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        mapImage.image = UIImage(named: map[indexPath.row].image)
        //employerCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / CGFloat(map.count), height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
