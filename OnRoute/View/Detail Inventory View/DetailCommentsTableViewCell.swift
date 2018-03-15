//
//  DetailCommentsTableViewCell.swift
//  OnRoute
//
//  Created by Thong Tran on 3/15/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class DetailCommentsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func pressCommentsBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tailInventoryViewController", bundle: nil)
        let commentsVC = storyboard.instantiateViewController(withIdentifier: "CommentsInventoryTableViewController") as! CommentsInventoryTableViewController
         commentsVC.modalPresentationStyle = .overCurrentContext
        self.window?.rootViewController?.present(commentsVC, animated: true, completion: nil)
 
       
        
       // present(commentsVC, animated: true, completion: nil)
    }
}
