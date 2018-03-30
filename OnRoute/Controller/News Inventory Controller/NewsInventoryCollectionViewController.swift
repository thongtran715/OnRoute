//
//  NewsfeedCollectionViewController.swift
//  Facebook+Research
//
//  Created by Duc Tran on 3/20/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Floaty

class NewsInventoryCollectionViewController : UICollectionViewController, FloatyDelegate
{
    var searchController: UISearchController!
    var posts: [Post]?
    var fab = Floaty()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchPosts()
        collectionView?.contentInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        setUpLeftButton()
        setUpRightButton()
        if let layout = collectionView?.collectionViewLayout as? InventoryLayout {
            layout.delegate = self
        }
        layoutFAB()
    }
    func layoutFAB() {
        let item = FloatyItem()
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.title = "Custom item"
        item.handler = { item in
        }
        
        fab.addItem(title: "I got a title")
        fab.addItem("I got a icon", icon: UIImage(named: "icShare"))
        fab.addItem("titlePosition right?", icon: UIImage(named: "icShare"), titlePosition: .right) { (item) in
            let alert = UIAlertController(title: "titlePosition right", message: "titlePosition is right", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok...", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.fab.close()
        }
        fab.addItem("titlePosition nil?", icon: UIImage(named: "icShare"), titlePosition: nil) { (item) in
            let alert = UIAlertController(title: "titlePosition nil", message: "titlePosition nil will be left", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok...", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.fab.close()
        }
        fab.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.fab.close()
        }
        fab.addItem(item: item)
        fab.sticky = true
        fab.paddingX = fab.frame.width/2
        fab.plusColor = UIColor.white
        fab.buttonColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        fab.fabDelegate = self
        
     
        
        self.view.addSubview(fab)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 2.0) {
            cell.alpha = 1.0

        }
    }
    
    
    private func setUpLeftButton () {
        let button  = UIButton(type: .custom)
        if let image = UIImage(named: "cancel") {
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(NewsInventoryCollectionViewController.ClickedCancel), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    private func setUpRightButton () {
        let button  = UIButton(type: .custom)
        if let image = UIImage(named: "switch") {
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(NewsInventoryCollectionViewController.switchBtn), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func switchBtn() {
        let  mainStory = UIStoryboard(name: "Main", bundle: nil)
        let search = mainStory.instantiateViewController(withIdentifier: "ServicesViewController") as! ServicesViewController
        UIView.beginAnimations("animation", context: nil)
        UIView.setAnimationDuration(1.0)
        self.navigationController!.pushViewController(search, animated: false)
        UIView.setAnimationTransition(UIViewAnimationTransition.flipFromLeft, for: self.navigationController!.view, cache: false)
        UIView.commitAnimations()    }
    @objc func ClickedCancel () {
        print (1)
        self.dismiss(animated: true, completion: nil)
    }
    
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        self.collectionView?.reloadData()
    }
}

extension NewsInventoryCollectionViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCollectionViewCell
        cell.post = self.posts?[indexPath.item]
        return cell
    }
}

extension NewsInventoryCollectionViewController : InventoryLayoutDelegate
{
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    {
        if let post = posts?[indexPath.item], let photo = post.image {
            let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect = AVMakeRect(aspectRatio: photo.size, insideRect: boundingRect)
            
            return rect.size.height
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    {
        if let post = posts?[indexPath.item] {
            let topPadding = CGFloat(8)
            let bottomPadding = CGFloat(12)
            let captionFont = UIFont.systemFont(ofSize: 15)
            let captionHeight = self.height(for: post.caption!, with: captionFont, width: width)
            let profileImageHeight = CGFloat(36)
            let height = topPadding + captionHeight + topPadding + profileImageHeight + bottomPadding
            
            return height
        }
        
        return 0.0
    }
    
    func height(for text: String, with font: UIFont, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(64.0)
        let textAttributes = [NSAttributedStringKey.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
}















