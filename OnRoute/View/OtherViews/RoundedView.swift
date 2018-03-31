//
//  RoundedView.swift
//  OnRoute
//
//  Created by Thong Tran on 3/30/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    override func awakeFromNib() {
        setUpView()
    }

    func setUpView () {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

}
