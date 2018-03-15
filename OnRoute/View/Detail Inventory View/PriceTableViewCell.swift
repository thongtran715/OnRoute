//
//  PriceTableViewCell.swift
//  OnRoute
//
//  Created by Thong Tran on 3/14/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameInventory: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
        addToCartOutlet.setImage(UIImage(named: "addtocart"), for: .normal)
        addToCartOutlet.setTitle("To Cart", for: .normal)
        reportOutlet.setImage(UIImage(named: "flag"), for: .normal)
        reportOutlet.setTitle("Report", for: .normal)
        reportOutlet.alignImageAndTitleVertically()
        addToCartOutlet.alignImageAndTitleVertically()
        askOutlet.setImage(UIImage(named:"ask"), for: .normal)
        askOutlet.setTitle("Ask", for: .normal)
        askOutlet.alignImageAndTitleVertically()
        
        shareOutlet.setImage(UIImage(named: "share"), for: .normal)
        shareOutlet.setTitle("Share", for: .normal)
        shareOutlet.alignImageAndTitleVertically()
        
        
        // Initialization code
    }

    
    
    
    
    @IBOutlet weak var askOutlet: UIButton!
    
    @IBAction func askBtn(_ sender: Any) {
        print ("Ask Button ")
    }
    
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    @IBAction func addToCartBtn(_ sender: Any) {
    }
    
    func updateUI () {
        
    }
    @IBOutlet weak var shareOutlet: UIButton!
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    @IBOutlet weak var reportOutlet: UIButton!
    @IBAction func reportBtn(_ sender: Any) {
        
    }
}
extension UIButton {
    
    func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }
    
}
