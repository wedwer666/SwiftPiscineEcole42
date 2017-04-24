//
//  SecondViewController.swift
//  Day05
//
//  Created by Mitriuc Maria on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (AppData.locations.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DataLocationTableViewCell
        cell.label?.text = AppData.locations[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.curLocation = AppData.locations[indexPath.row]
        DispatchQueue.main.async {
            self.performSegue(withIdentifier : "showMap", sender: Any?.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

