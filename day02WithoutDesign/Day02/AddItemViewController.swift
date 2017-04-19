//
//  AddItemViewController.swift
//  Day02
//
//  Created by Mitriuc Maria on 4/19/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    
    var deathnote = [" "]
    var deathyear = " "
    var deathdescripton = [" "]
    
    @IBOutlet weak var name: UITextField!
    
   // @IBOutlet weak var Date: UITextField!
  
    @IBOutlet weak var Date: UIDatePicker!
    
    @IBOutlet weak var desc: UITextField!
    
    //var receivedString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
      //  addItem.text = receivedString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let view = self.navigationController?.viewControllers[0] as? DeathNoteTableViewController
        // Date.date.description(with: Locale.current)
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
//        deathyear = dateFormatter.string(from: Date.date)
        
        view?.deathnote.append(name.text!)
        view?.deathyear.append(Date.date.description(with: Locale.current))
        view?.deathdescripton.append(desc.text!)
        view?.tableView.reloadData()
        self.navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
