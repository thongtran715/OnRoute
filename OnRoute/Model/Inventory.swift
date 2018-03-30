//
//  Inventory.swift
//  OnRoute
//
//  Created by Thong Tran on 3/13/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import Foundation
import FirebaseDatabase
class Inventory {
    
    
    init(currUid currentUserUId: String, in_name inventoryname: String, in_ownwer_id inventoryowner_uid: String, in_price inventoryprice: String, in_des inventorydescription: String ) {
        self.currentUser_uid = currentUserUId
        self.inventory_name = inventoryname;
        self.inventory_price = inventoryprice;
        self.inventory_description = inventorydescription;
        self.inventory_owner_uid = inventoryowner_uid;
    }
    
    public func setImage (img image : UIImage){
        self.inventory_image = image
    }
    // Setting up the variables
    private var currentUser_uid : String?
    private var inventory_name:String?;
    private var inventory_owner_uid:String?;
    private var inventory_price:String?;
    private var inventory_description:String?;
    private var inventory_image : UIImage!
    
    // Setting up the function to write to the firebase
    
    public func write_inventory_to_fb () -> Int
    {
        var errorness = 0
        if (currentUser_uid == nil || inventory_name == nil || inventory_owner_uid == nil || inventory_price == "" || inventory_description == "")
        {
            print ("Missing required info ")
            return -1;
        }
        else {
            var ref: DatabaseReference!
            ref = Database.database().reference(fromURL: "https://onroute-947cd.firebaseio.com/")
            let key = ref.child("Inventory").childByAutoId().key
            let inventories = ["Seller_Id" : currentUser_uid, "inventory_name" : inventory_name, "inventory_owner_uid": inventory_owner_uid, "inventory_price" :inventory_price, "inventory_des" : inventory_description]
            
            let childUpdates = ["/Inventory/\(key)": inventories, "/users-inventory/\(String(describing: currentUser_uid))/\(key)/": inventories]
            ref.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print ("Fail upload")
                    errorness = -2
                }
                else
                {
                    print ("Successfully upload")
                    errorness = 1;
                }
            })
            
        }
        return errorness;
    }
    
  
}

