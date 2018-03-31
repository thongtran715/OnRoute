//
//  CircleView.swift
//  OnRoute
//
//  Created by Thong Tran on 3/30/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class CircleView: UIView {
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setUpView()
        }
    }
    override func awakeFromNib() {
        setUpView()
    }
    func setUpView () {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
        
    }
    
}
