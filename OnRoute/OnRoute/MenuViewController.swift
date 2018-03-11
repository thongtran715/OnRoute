//
//  MenuViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/11/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var arrMenuTitles = ["Payment","Carts","Favorite", "Upcoming Route","Help","Legal","Settings","Become Router"]
    var arrMenuImages = [UIImage(named: "payment"),UIImage(named: "cart"),UIImage(named: "favorite"),UIImage(named: "truck"),UIImage(named: "help"),UIImage(named: "legal"),UIImage(named: "setting"),UIImage(named: "router")]
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.cornerRadius = self.imageProfile.frame.size.width/2
        imageProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
    }



  

}
extension MenuViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuImages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.imageMenu.image = arrMenuImages[indexPath.row]
        cell.labelMenu.text = arrMenuTitles[indexPath.row]
        return cell
    }
}
