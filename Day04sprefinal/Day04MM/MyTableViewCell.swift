//
//  MyTableViewCell.swift
//  Day04MM
//
//  Created by Mitriuc Maria on 4/21/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
