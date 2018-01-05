//
//  ViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 15.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit
import Foundation
extension Notification.Name {
    static let toggleMenu =  Notification.Name(rawValue: "toggleMenu")
}

class CitiesTableViewController: UIViewController, UITableViewDataSource {
    let slideMenuInstance = ContainerVC()
    @IBOutlet weak var tableView: UITableView!
     override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.shared.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = DataServices.shared.cities[indexPath.row].name
        cell.detailTextLabel?.text = "\(DataServices.shared.cities[indexPath.row].cityCode)"
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTVC = segue.destination as! DisctrictsTableViewController
        if let index = tableView.indexPathForSelectedRow?.row {
            destinationTVC.selectedCityCode = DataServices.shared.cities[index].cityCode
            UserDefaults.standard.set(DataServices.shared.cities[index].name, forKey: "cityName")
        }
    }
    
 
    
    @IBAction func notifyHamburgerBtnTapped() {
        NotificationCenter.default.post(name: Notification.Name.toggleMenu, object: self)
    }
    

}


