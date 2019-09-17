//
//  ViewController.swift
//  MobilePhoneBuyer’sGuide
//
//  Created by Aksorn Khantasit on 16/9/2562 BE.
//  Copyright © 2562 Aksorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mobiles: [Mobile] = []
    
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var favouriteView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func indexchange(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            allView.isHidden = false
            favouriteView.isHidden = true
        case 1:
            allView.isHidden = true
            favouriteView.isHidden = false
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allView.isHidden = false
        favouriteView.isHidden = true
        
        let bundle = Bundle(for: TableViewCell.self)
        let nib = UINib(nibName: "TableViewCell", bundle: bundle)
        tableview.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        getBeers()
        
    }
    
    func getBeers() {
        //loadingView.isHidden = false
        let apiManager = APIManager()
        apiManager.getBeers(urlString: "https://scb-test-mobile.herokuapp.com/api/mobiles/") { [weak self] (result: Result<[Mobile], APIError>) in
            switch result {
            case .success(let beers):
                print("faii")
                self?.mobiles.append(contentsOf: beers)
                DispatchQueue.main.sync {
                    //self?.loadingView.isHidden = true
                    self?.tableview.reloadData()
                   
                }
            case .failure(let error):
                print(error.localizedDescription)
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .destructive)
                alert.addAction(action)
                DispatchQueue.main.sync {
                    //self?.loadingView.isHidden = true
                    self?.present(alert, animated: true)
                }
            }
        }
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
                return UITableViewCell()
        }
        let mobile = mobiles[indexPath.row]
        cell.setupUI(mobile: mobile)
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 1000.0;//Choose your custom row height
//    }

        
}


