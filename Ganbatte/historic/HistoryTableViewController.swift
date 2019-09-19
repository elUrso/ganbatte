//
//  HistoryTableViewController.swift
//  Ganbatte
//
//  Created by Student on 18/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    var activities = [Activity]()
    @IBOutlet var nothingOutlet: UILabel!
    
    @objc func updateActivities() {
        if let data = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            do {
                try activities = decoder.decode([Activity].self, from: data)
                activities.reverse()
                tableView.reloadData()
            } catch { }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateActivities()
        
        if activities.count > 0 {
            nothingOutlet.text = ""
        }
        
        // NotificationCenter.default.addObserver(self, selector: #selector(updateActivities), name: UserDefaults.didChangeNotification, object: UserDefaults.standard)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        if let cell = cell as? HistoryTableViewCell {
            cell.titleOutlet.text = activities[indexPath.row].name
            cell.descriptionOutlet.text = activities[indexPath.row].description
            cell.dateOutlet.text = activities[indexPath.row].date.description
            cell.focusOutlet.text = activities[indexPath.row].focusedTime.asTimestamp
            cell.distractedOutlet.text = activities[indexPath.row].distractedTime.asTimestamp
        }
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailed" {
            if let activity = segue.destination as? ActivityDetailViewController {
                activity.activity = (sender as! Activity)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailed", sender: activities[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
