//
//  MenuTableViewCell.swift
//  OnRoute
//
//  Created by Thong Tran on 3/11/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var labelMenu: UILabel!
    @IBOutlet weak var imageMenu: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
