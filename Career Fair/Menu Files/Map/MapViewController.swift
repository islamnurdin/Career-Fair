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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var mapViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var companyTable: UITableView!
    
    private var map = MapMenu.mapList
    
    private var selectedFloor = 1
    private var companies = [Employer]()
    private var companiesByFloor: [Int : [Employer]] = [:]
    private var floors = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Карта"
        
        getEmployerData {
            self.companyTable.reloadData()
        }
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
 
        print(companiesByFloor)
        floorCollectionView.reloadData()
 
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapImage
    }

    func getEmployerData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/employer/")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.companies = try JSONDecoder().decode([Employer].self, from: data!)
                self.companiesByFloor = Dictionary(grouping: self.companies, by: {$0.floor})
                self.floors = self.companiesByFloor.keys.sorted()

                //print("FFFFFd", self.floors)
                //print(self.companiesByFloor)
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

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (companiesByFloor[selectedFloor] != nil) {
            return companiesByFloor[selectedFloor]!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as! CompanyCell
        let company = companiesByFloor[selectedFloor]!
        let companies = company[indexPath.item]
        cell.companyDetails.text = companies.description
        cell.companyName.text = companies.full_name
        let urlString = companies.logo_url
        let url = URL(string: urlString)
        if url != nil {
            cell.companyImg.downloadedFrom(url: url!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmployerDetailsVC") as! EmployerDetailsVC
        vc.employer = companiesByFloor[selectedFloor]?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
        
        selectedFloor = indexPath.row+1
        companyTable.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / CGFloat(map.count), height: collectionView.frame.size.height)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

