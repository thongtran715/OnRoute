//
//  MenuViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/11/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit
import Stripe
class MenuViewController: UIViewController {
    var arrMenuTitles = ["Payment","Carts", "Upcoming Route","Help","Legal","Settings","Become Router"]
    var arrMenuImages = [UIImage(named: "payment"),UIImage(named: "cart"),UIImage(named: "truck"),UIImage(named: "help"),UIImage(named: "legal"),UIImage(named: "setting"),UIImage(named: "router")]
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.cornerRadius = self.imageProfile.frame.size.width/2
        imageProfile.clipsToBounds = true
 
//        // Do any additional setup after loading the view.
//        var inven = Inventory(currUid: "1", in_name: "Mattress", in_ownwer_id: "2", in_price: "4.3", in_des: "This is greate")
//        if inven.write_inventory_to_fb() == 1 {
//
//        }
//        var cart  = Carts(currentUser: "2", inId: "-L7VwU7jtSQ6gFSrlGE7")
//        cart.write_cart_to_db()
//
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        if cell.labelMenu.text == "Payment" {
            let addCardViewController = STPAddCardViewController()
            addCardViewController.delegate = self
            // STPAddCardViewController must be shown inside a UINavigationController.
            let navigationController = UINavigationController(rootViewController: addCardViewController)
            self.present(navigationController, animated: true, completion: nil)
        }
        if cell.labelMenu.text == "Carts"{
            //let cartViewColler = CartViewController()
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
            let navigationController = UINavigationController(rootViewController: newViewController)
            self.present(navigationController, animated: true, completion: nil)

        }
    }
    
}
extension MenuViewController : STPAddCardViewControllerDelegate{
    
    // MARK: STPAddCardViewControllerDelegate
    
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        
        print(token)
        //Use token for backend process
        self.dismiss(animated: true, completion: {
            completion(nil)
        })
}
}







