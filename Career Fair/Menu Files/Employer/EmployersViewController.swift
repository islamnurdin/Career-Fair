//
//  EmployersViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/14/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class EmployersViewController: UIViewController {

    var employers = [Employer]()
    
    @IBOutlet weak var collView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Работодатели"
        getEmployerData {
            self.collView.reloadData()
        }
        
        collView.delegate = self
        collView.dataSource = self
    }

    func getEmployerData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/employer/")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.employers = try JSONDecoder().decode([Employer].self, from: data!)
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

extension EmployersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployersViewController", for: indexPath) as! EmployersCollectionViewCell
        cell.companyName.text = employers[indexPath.row].full_name
        cell.companyDescrp.text = employers[indexPath.row].description
        
        let urlString = employers[indexPath.row].logo_url
        let url = URL(string: urlString)
        cell.companyImage.downloadedFrom(url: url!)
        cell.companyImage.applyStylesToImage()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destViewController = segue.destination as? EmployerDetailsVC {
            let indexPaths : NSArray = collView.indexPathsForSelectedItems! as NSArray
            let indexx : IndexPath = indexPaths[0] as! IndexPath
            destViewController.employer = employers[indexx.row]
        }
    }
}

extension EmployersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
}
