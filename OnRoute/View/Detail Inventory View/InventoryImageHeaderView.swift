//
//  InventoryImageHeaderView.swift
//  OnRoute
//
//  Created by Thong Tran on 3/14/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class InventoryImageHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var pageControl: UIPageControl!
    
}

extension InventoryImageHeaderView: InventoryPageViewControllerDelegate {
    func setupPageController(numberOfPages: Int) {
       pageControl.numberOfPages =  numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
}
