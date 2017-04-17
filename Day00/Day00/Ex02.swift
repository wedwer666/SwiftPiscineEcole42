//
//  Ex02.swift
//  Day00
//
//  Created by Mitriuc Maria on 4/17/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit


extension String {
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
}

class Ex02: UIViewController {

 
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        if (performingMath == true )
        {
            label.text = String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!
            performingMath = false
          //  print("\(numbers) este");
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    @IBAction func neg(_ sender: UIButton)
    {
       
        if (label.text == "-")
        {
            label.text = label.text!.substring(from: 1);
        }
        else
        {
            label.text  = "-" + label.text!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 17
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 16 //impartirea
            {
                label.text = "/";
            }
            else if sender.tag == 14 //inmultirea
            {
                label.text = "*";
            }
            
            else if sender.tag == 15 //minus
            {
                label.text = "-";
            }
            else if sender.tag == 13 //plus
            {
                label.text = "+";
            }
            operation = sender.tag;
            performingMath = true;
        }
        
        
        else if sender.tag ==  17  //egal
        {
            if operation == 16  //divide
            {
                label.text = String(previousNumber / numberOnScreen)
                print("\(label.text) ");

            }
            else if operation == 13  //adunare
            {
                label.text = String(previousNumber + numberOnScreen)
                print("\(label.text) ");
            }
            else if operation == 14 //inmultire
            {
                label.text = String(previousNumber * numberOnScreen)
                print("\(label.text) ");
            }
            else if operation == 15  //minus
            {
                label.text = String(previousNumber - numberOnScreen)
                print("\(label.text) ");
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            print("\(label.text) ");
        }
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
