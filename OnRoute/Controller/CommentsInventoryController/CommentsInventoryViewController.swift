//
//  CommentsInventoryViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/15/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit

class CommentsInventoryViewController: UIViewController,HalfModalPresentable {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpLeftButton()
        setUpRightButton()
        self.view.backgroundColor = .clear
        self.view.isOpaque = false
        self.tableView.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.tableView.backgroundView = blurEffectView
        self.tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurEffect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func ClickedCancel () {
        print (1)
        if let delegate = navigationController?.transitioningDelegate as? HalfModalTransitioningDelegate {
            delegate.interactiveDismiss = false
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setUpLeftButton () {
        let button  = UIButton(type: .custom)
        if let image = UIImage(named: "cancel") {
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(CommentsInventoryViewController.ClickedCancel), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    private func setUpRightButton () {
        let button  = UIButton(type: .custom)
        button.setTitle("Move Up", for: .normal)
        let color = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        button.addTarget(self, action: #selector(CommentsInventoryViewController.moveUp), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func moveUp (){
       
        maximizeToFullScreen()
  
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CommentsInventoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsInventoryTableViewCell") as! CommentsInventoryTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsInventoryTableViewCell") as! CommentsInventoryTableViewCell
        let height = cell.commentLabelText.frame.height + 80
        return height
    }
    
    
    
    
}
