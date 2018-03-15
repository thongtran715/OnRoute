//
//  InventoryImageViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/14/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class InventoryImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            imageView.image = image
        // Do any additional setup after loading the view.
    }
    


}
