//
//  CommentsInventoryTableViewCell.swift
//  OnRoute
//
//  Created by Thong Tran on 3/15/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit
import Cosmos
class CommentsInventoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var commentsText: UILabel!
    
    @IBOutlet weak var timePosted: UILabel!
    @IBOutlet weak var startView: CosmosView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
