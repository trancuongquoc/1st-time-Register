//
//  DisctrictsTableViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 16.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class DisctrictsTableViewController: UITableViewController {
    
    var selectedCityCode: Int = 0
    var districtsOfSelectedCity = [District]()
    override func viewDidLoad() {
        super.viewDidLoad()

            districtsOfSelectedCity = DataServices.shared.districts.filter { $0.cityCode == selectedCityCode }   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return districtsOfSelectedCity.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = districtsOfSelectedCity[indexPath.row].districtName
        cell.detailTextLabel?.text = "\(districtsOfSelectedCity[indexPath.row].districtCode)"
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            UserDefaults.standard.set(districtsOfSelectedCity[indexPath.row].districtName, forKey: "districtName")
        
    }
}
