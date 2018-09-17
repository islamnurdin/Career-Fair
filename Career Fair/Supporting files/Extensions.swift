//
//  Extensions.swift
//  Career Fair
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyStyleView() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 10.0)
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.width - 1, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}

extension UIImageView {
    
    func applyStylesToImage() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
    
    func addShadowBottom() {
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = UIColor.red.cgColor
    }
    
    func applyStyleToSelectedView() {
        self.layer.shadowColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
    }
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

extension UITableViewCell {
    
    func applyStyleViewCell() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 7
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}

extension UIViewController {
    
    func presentViewController(vc: String, sb: String) {
        let sb = UIStoryboard(name: sb, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func deleteBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
