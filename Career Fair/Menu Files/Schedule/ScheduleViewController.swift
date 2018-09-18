//
//  ScheduleViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/7/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class ScheduleViewController: UIViewController {
    
    var schedule = [Schedule]()
    
    @IBOutlet weak var collView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getScheduleData {
            self.collView.reloadData()
        }

    }

    func getScheduleData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/shedule/")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            print(response.result)
            do {
                self.schedule = try JSONDecoder().decode([Schedule].self, from: data!)
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

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as! ScheduleCollectionViewCell
    
        let startTime = schedule[indexPath.row].start.prefix(5)
        let endTime = schedule[indexPath.row].end.prefix(5)
        
        cell.time.text = String(startTime)
        cell.theme.text = schedule[indexPath.row].subject
        cell.speaker.text = String(endTime)
        cell.location.text = schedule[indexPath.row].place
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        return CGSize(width: height, height: height)
    }
}
