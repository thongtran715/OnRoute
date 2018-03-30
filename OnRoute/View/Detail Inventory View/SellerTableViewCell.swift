//
//  SellerTableViewCell.swift
//  OnRoute
//
//  Created by Thong Tran on 3/14/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class SellerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        sellerImage.layer.cornerRadius = self.sellerImage.frame.size.width/2
        sellerImage.clipsToBounds = true
        // Initialization code
    }
    var isAnimated = false
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var sellerImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
