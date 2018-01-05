//
//  SlideMenu.swift
//  1st-time-Register
//
//  Created by Apple on 12/27/17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class SlideMenu: UITableViewController {

    var users = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        navigationItem.rightBarButtonItem = editButtonItem
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! TableViewCell
        cell.cityLabelField.text = users[indexPath.row].city
        cell.districtLabelField.text = users[indexPath.row].district
        cell.genderLabelField.text = users[indexPath.row].gender
        cell.ageLabelField.text = "\(users[indexPath.row].age)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "editItem":
            guard let editUserVC = segue.destination.topVC as? EditUserViewController else { return }
            guard let selectedUserCell = sender as? TableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: selectedUserCell) else { return }
            let selectedUser = users[indexPath.row]
            editUserVC.user = selectedUser
        default:
            print("error")
        }
       
    }

}
extension UIViewController {
    var topVC : UIViewController? {
        get {
            if self is UINavigationController {
                return (self as! UINavigationController).topViewController
            }
            return self
        }
    }
    
}
