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
    var select : UIImage?
    var cells : [NasaCollectionViewCell?] = Array()
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

//    var imgContrler = MyImageViewController()
//    self.presentViewController(nextViewController, animated:true, completion:nil)
    @IBAction func testButton(_ sender: Any) {
    }
    var collectionView: UICollectionView!
    var images = ["https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/hubblehs201637alargeweb-1.jpg?itok=WzjQYVUT",
                  "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/heic0109a.jpg?itok=6rysPgMd",
                  "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/stsci-h-p1708a-m-1823x2000.png?itok=OQM9x_TT",
                  "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/stsci-h-p1708a-m-1823x2000.png?itok=OQM9x_TT"]
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

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
        collectionView.backgroundColor = UIColor.blue
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
        cells.append(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("----------------------in collection-------------------------------")
//        select = cells[indexPath.row]
        let imgControler = storyBoard.instantiateViewController(withIdentifier: "MyImageViewControler") as! MyImageViewController
        imgControler.setParenrImgControler(img: cells[indexPath.row])
        self.present(imgControler, animated:true, completion:nil)

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


//extension UIView {
//    
//    var parentViewController: UIViewController? {
//        
//        return next(UIViewController.self)
//    }
//}

//extension UIResponder {
//    
//    func next<T: UIResponder>(_ type: T.Type) -> T? {
//        
//        switch next {
//            
//        case let responder as T:
//            return responder
//            
//        case let .some(responder):
//            return responder.next(type)
//            
//        default:
//            return nil
//        }
//    }
//}
















