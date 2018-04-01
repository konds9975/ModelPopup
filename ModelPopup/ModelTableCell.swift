//
//  ModelTableCell.swift
//  ModelPopup
//
//  Created by Kondiram Sonawane on 4/1/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit

class ModelTableCell: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
