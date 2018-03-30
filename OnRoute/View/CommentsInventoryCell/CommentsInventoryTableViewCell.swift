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

    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var commentLabelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        rating.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
