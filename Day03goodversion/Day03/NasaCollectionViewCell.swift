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
    
    
    override func awakeFromNib()
    {
        nasaImageView = UIImageView(frame: contentView.frame)
        nasaImageView.contentMode = .scaleAspectFill
        nasaImageView.clipsToBounds = true
        contentView.addSubview(nasaImageView)
    }
}
