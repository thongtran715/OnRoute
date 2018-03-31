//
//  GradientView.swift
//  OnRoute
//
//  Created by Thong Tran on 3/30/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class GradientView: UIView {

   let gradient = CAGradientLayer()
    override func awakeFromNib() {
        setUpGradientView()
    }
    
    func setUpGradientView () {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white:1.0, alpha:0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x:0, y:1)
        gradient.locations = [0.8,1.0]
        self.layer.addSublayer(gradient)
        self.bringSubview(toFront: self.subviews.first!)
    }

}




