//
//  EmployerDetailsVC.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/10/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class EmployerDetailsVC: UIViewController {

    var employer: Employer?
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyDetails: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = employer?.full_name
        companyName.text = employer?.full_name
        companyDetails.text = employer?.description
        
        let urlString = employer?.logo_url
        let url = URL(string: urlString!)
        companyImage.downloadedFrom(url: url!)
        companyImage.applyStylesToImage()

    }
}
