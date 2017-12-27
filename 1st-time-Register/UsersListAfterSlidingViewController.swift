//
//  UsersListAfterSlidingViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 21.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit
import Foundation

class UsersListAfterSlidingViewController: UIViewController, UITableViewDataSource {
    var users = [Person]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            users = try AppDelegate.shared?.persistentContainer.viewContext.fetch(Person.fetchRequest()) as! [Person]
        } catch {
            print(error)
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! TableViewCell
        cell.cityLabelField.text = users[indexPath.row].city
//        cell.districtLabelField.text = users[indexPath.row].district
//        cell.genderLabelField.text = users[indexPath.row].gender
//        cell.ageLabelField.text = "\(users[indexPath.row].age)"
        return cell
    }
    
  
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppDelegate.shared?.persistentContainer.viewContext.delete(users[indexPath.row])
            AppDelegate.shared?.saveContext()
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
    }

}
