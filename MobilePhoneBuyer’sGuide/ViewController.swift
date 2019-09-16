//
//  ViewController.swift
//  MobilePhoneBuyer’sGuide
//
//  Created by Aksorn Khantasit on 16/9/2562 BE.
//  Copyright © 2562 Aksorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var favouriteView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let bundle = Bundle(for: TableViewCell.self)
        let nib = UINib(nibName: "TableViewCell", bundle: bundle)
        tableview.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    
    @IBAction func indexchange(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            allView.isHidden = false
            favouriteView.isHidden = true
        case 1:
            print("fai")
            allView.isHidden = true
            favouriteView.isHidden = false
        default:
            break;
        }
        
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
                return UITableViewCell()
        }
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 1000.0;//Choose your custom row height
//    }

        
}


