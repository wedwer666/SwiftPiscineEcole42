//
//  CustomTableViewCell.swift
//  Day02
//
//  Created by Mitriuc Maria on 4/19/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    
    var deathnote = [" "]
    var deathyear = [" "]
    var deathdescripton = [" "]
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var descript: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
