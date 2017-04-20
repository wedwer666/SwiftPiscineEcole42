//
//  ViewController.swift
//  Day03
//
//  Created by Mitriuc Maria on 4/20/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIND: UIActivityIndicatorView!
    
    var collectionView: UICollectionView!
    var images = ["https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/hubblehs201637alargeweb-1.jpg?itok=WzjQYVUT",
                  "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/heic0109a.jpg?itok=6rysPgMd",
                  "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/stsci-h-p1708a-m-1823x2000.png?itok=OQM9x_TT",
                  "asdasdasd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    //initializing the colection view and adding it
    func setupCollectionView()
    {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
    //    layout.sectionInset = UIEdgeInsetsMake(top: 0 ,left: 5,right: 0, bottom: 5)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(NasaCollectionViewCell.self, forCellWithReuseIdentifier: "nasaCell")
        collectionView.backgroundColor = UIColor.yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    

    func  collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: NSIndexPath) {
        print("user tappend on image")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nasaCell", for: indexPath) as!
        NasaCollectionViewCell
        cell.awakeFromNib()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        if let checkedUrl = URL(string: self.images[indexPath.row])
        {
            cell.nasaImageView.contentMode = .scaleAspectFit
          
            cell.downloadImage(view: self, url: checkedUrl)
        } else
        {
           
        }
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
//    {
//        let nasaCell =  cell as! NasaCollectionViewCell
//        nasaCell.nasaImageView.setImageFromURL(stringImageUrl : images[indexPath.row])
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50 , height: 200 )
    
    }
}





extension UIImageView
{
    func setImageFromURL(stringImageUrl url: String)
    {
        
    if let url = NSURL(string: url)
    {
        if let data = NSData(contentsOf: url as URL)
        {
        self.image = UIImage(data: data as Data)
        }
    }
}
}
















