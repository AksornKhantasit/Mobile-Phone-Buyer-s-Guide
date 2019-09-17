//
//  TableViewCell.swift
//  MobilePhoneBuyer’sGuide
//
//  Created by Aksorn Khantasit on 16/9/2562 BE.
//  Copyright © 2562 Aksorn. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var mobileImageView: UIImageView!
    
    func setupUI(mobile: Mobile) {
        name.text = mobile.name
        detail.text = mobile.description
        price.text = "$\(mobile.price)"
        rating.text = "\(mobile.rating)"
        if let url = URL(string: mobile.thumbImageURL) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    self.mobileImageView.image = image
                }
            }
        }
    }
}
