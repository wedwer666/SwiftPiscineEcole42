//
//  ViewController.swift
//  Day04MM
//
//  Created by Mitriuc Maria on 4/21/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //importing objects
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func search(_ sender: Any)
    {
        if  myTextField.text != ""
        {
            let user = myTextField.text?.replacingOccurrences(of: " ", with: "")
            getStuff(user: user!)
        }
    }
    
    //creating function that gets of all the stuff
    
    func getStuff(user: String)
    {
        let url = URL(string: "https://twitter.com/" + user)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                DispatchQueue.main.async
                {
    
                        if let errorMessage = error?.localizedDescription
                        {
                            self.myLabel.text = errorMessage
                        }
                        else
                        {
                            self.myLabel.text = "There has been a error. Try again. "
                        }
                    }
                }
            else
            {
                let webContent: String = String(data: data!, encoding: String.Encoding.utf8)!
                
                //print(webContent)
                //get the name
                var array: [String] = webContent.components(separatedBy: "<title>")
                array = array[1].components(separatedBy: " |")
                let name = array[0]
                //print(name)
                
                //get the profile picture
                array = webContent.components(separatedBy: "data-resolved-url-large=\"")
                array = array[1].components(separatedBy: "\"")
                let profilePicture = array[0]
                print(profilePicture)
                
//                DispatchQueue.main.async
//                {
//                    self.myLabel.text = name
//                }
            }
        }
        task.resume()
    }
    
    
   //function that gets profile picture
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

