//
//  MyImageViewController.swift
//  Day03
//
//  Created by Mitriuc Maria on 4/20/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class MyImageViewController: UIViewController, UIScrollViewDelegate {

   // @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func testButton(_ sender: Any) {
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0

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
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
