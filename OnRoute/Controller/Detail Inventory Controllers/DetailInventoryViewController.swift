//
//  DetailInventoryViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/14/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class DetailInventoryViewController: UIViewController {

    
    @IBOutlet weak var inventoryImagesHeaderView : InventoryImageHeaderView!
    
    var images = [UIImage(named: "1")!, UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Mattress"
        // Do any additional setup after loading the view.
    }
    struct Storyboard_Cell {
        static  var priceCell = "PriceInventoryCell"
        static var detailCell = "DetailInventory"
        static var sellerCell = "SellerTableViewCell"
        static var mapCell = "MapTableViewCell"
        static var commentsBtn = "DetailCommentsTableViewCell"
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InventoryImageViewController"{
            if let imagesPageVC = segue.destination as? InventoryImagesPageViewController {
                imagesPageVC.images = images
                imagesPageVC.pageViewControllerDelegate = inventoryImagesHeaderView
            }
        }
    }
    
    
    
}


extension DetailInventoryViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.priceCell) as! PriceTableViewCell
           //cell.priceLabel.text = "$400"
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.detailCell) as! DetailTableViewCell
            cell.detail.text = "Comfortable Mattress with the easy for sleep. You can sleep anytime you want with this"
            cell.isUserInteractionEnabled = false
            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.sellerCell)
            return cell!
        }
        
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.mapCell)
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.commentsBtn)
            return cell!
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 220
        }
        else if indexPath.row == 2{
            return 100
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard_Cell.detailCell) as! DetailTableViewCell
            let height = cell.detail.frame.height
            return height
        }
        else if indexPath.row == 4{
            return 100
        }
        else {
        return 200
        }
    }
}
