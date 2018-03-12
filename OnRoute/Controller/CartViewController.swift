//
//  CartViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/11/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
            let titleImageView = UIImageView(image:#imageLiteral(resourceName: "cart-checkout"))
            titleImageView.image?.withRenderingMode(.alwaysOriginal)
            titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            titleImageView.contentMode = .scaleAspectFill
            navigationItem.titleView = titleImageView
         */
        navigationItem.title = "Your Carts"
        
        setUpNavButtions()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
 
        
        // Do any additional setup after loading the view.
    }
    private func setUpNavButtions () {
        self.setUpLeftButton()
        self.setUpRightButton()
    }
    private func setUpRightButton () {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear All", style: UIBarButtonItemStyle.plain, target: self, action: #selector(CartViewController.handleClearOut))

    }
    private func setUpLeftButton () {
        let button  = UIButton(type: .custom)
        if let image = UIImage(named: "cancel") {
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(CartViewController.ClickedCancel), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func handleClearOut() {
        print("Something happends")
    }
    
    @objc func ClickedCancel () {
        print (1)
        self.dismiss(animated: true, completion: nil)
    }
  

}

extension CartViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell")
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}




