//
//  imageView.swift
//  OnRoute
//
//  Created by Thong Tran on 3/30/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class imageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        setImageCircleGround()
    }
    
        func setImageCircleGround () {
            self.layer.cornerRadius = self.frame.width/2
            self.clipsToBounds = true
        }
    

}
