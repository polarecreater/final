//
//  DoneTableViewController.swift
//  2017111245
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
class DoneTableViewController: UITableViewController {
    var dones: [NSManagedObject] = []
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    @IBOutlet var doneTab: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return dones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Done Cell", for: indexPath)
        let done = dones[indexPath.row]
        var display: String = ""
        var display2: String = ""
        var display3: String = ""
        if let whoLabel = done.value(forKey: "who") as? String {
            display = whoLabel }
        if let whatLabel = done.value(forKey: "what") as? String {
            display2 = whatLabel }
        if let colorLabel = done.value(forKey: "color") as? String {
            display3 = colorLabel }
        
        cell.textLabel?.text = display2
        cell.detailTextLabel?.text = display
        
        
        if display3 == "파란색"{
            cell.backgroundColor = UIColor.init(red: CGFloat(0.0),green: CGFloat(0.0),blue: CGFloat(255.0), alpha: 1.0)
        }
        else if display3 == "빨간색"{
            cell.backgroundColor = UIColor.init(red: CGFloat(255.0),green: CGFloat(0.0),blue: CGFloat(0.0), alpha: 1.0)
        }
        else {
            cell.backgroundColor = UIColor.init(red: CGFloat(0.0),green:CGFloat(255.0),blue: CGFloat(0.0), alpha: 1.0)
        }
    
        return cell
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Color")
        
        let sortDescriptor = NSSortDescriptor (key: "what", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            dones = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)") }
        
        self.tableView.reloadData()}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
