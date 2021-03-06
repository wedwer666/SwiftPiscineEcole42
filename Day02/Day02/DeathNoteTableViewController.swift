//
//  DeathNoteTableViewController.swift
//  Day02
//
//  Created by Mitriuc Maria on 4/19/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class DeathNoteTableViewController: UITableViewController {

    
    var deathnote = [" "]
    var deathyear = [" "]
    var deathdescripton = [" "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "yell.jpeg")!)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deathnote.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = UIColor.black
         tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        tableView.separatorColor = UIColor.black
        tableView.contentInset = UIEdgeInsets.zero
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!
        CustomTableViewCell
        cell.date?.text = deathnote[indexPath.row]
        cell.year?.text = deathyear[indexPath.row ]
        cell.descript?.text = deathdescripton[indexPath.row ]
        
        cell.backgroundColor = UIColor.brown
        cell.layer.borderWidth = 2.5
        cell.layer.cornerRadius = 10
        return cell
    }
    
   
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var addItem: AddItemViewController = segue.destinationViewControler
//    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
