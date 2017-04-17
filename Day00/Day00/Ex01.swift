//
//  Ex01.swift
//  Day00
//
//  Created by Mitriuc Maria on 4/17/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class Ex01: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var clickMe: UIButton!
    @IBAction func clickMe(_ sender: Any) {
        text.text = "Hello World !";
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
