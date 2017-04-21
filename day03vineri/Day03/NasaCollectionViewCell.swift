//
//  NasaCollectionViewCell.swift
//  Day03
//
//  Created by Mitriuc Maria on 4/20/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class NasaCollectionViewCell: UICollectionViewCell {
    
    
    var nasaImageView: UIImageView!
    var uploadIndicatorView: UIActivityIndicatorView!
    
    
    override func awakeFromNib()
    {
        uploadIndicatorView =  UIActivityIndicatorView()
        uploadIndicatorView.backgroundColor = UIColor.black
       // uploadIndicatorView.startAnimating()
        uploadIndicatorView.isHidden = false
        uploadIndicatorView.startAnimating()
        
        contentView.addSubview(uploadIndicatorView)
        
        
        nasaImageView = UIImageView(frame: contentView.frame)
        nasaImageView.contentMode = .scaleAspectFill
        nasaImageView.clipsToBounds = true
        contentView.addSubview(nasaImageView)
    }
    
  
//    func imageIsPressed(view: UIViewController, url: URL)
//    {
//        
//    }
//    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(view: UIViewController, url: URL) {
       
        
        uploadIndicatorView.startAnimating()
        uploadIndicatorView.isHidden = false
        getDataFromUrl(url: url) { (data, response, error)  in
            
            if nil != error {
                self.uploadIndicatorView.stopAnimating()
                self.uploadIndicatorView.isHidden = true
                print("must be error")
                let alertTitle = "Ooups, an error has ocured"
                let alert = UIAlertController(title: alertTitle, message: String(describing: error), preferredStyle: UIAlertControllerStyle.alert)
                let okBTN = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okBTN)
                view.present(alert, animated: true, completion: nil)
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.uploadIndicatorView.stopAnimating()
                self.uploadIndicatorView.isHidden = true
                self.nasaImageView.image = UIImage(data: data!)
               
            }
            
        }
       
    }
    
}
