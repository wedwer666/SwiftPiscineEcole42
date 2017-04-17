//
//  ViewController.swift
//  Day00
//
//  Created by Mitriuc Maria on 4/17/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clickMe: UIButton!
    
    @IBAction func clickMe(_ sender: Any) {
        print("Hello World !")
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

