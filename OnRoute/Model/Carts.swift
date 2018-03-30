//
//  Carts.swift
//  OnRoute
//
//  Created by Thong Tran on 3/13/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
class Carts {
    
    init(currentUser currentUserID: String, inId inventoyId: String) {
        self.currentUser_id = currentUserID
        self.inventory_id = inventoyId
    }
    private var currentUser_id: String?
    private var inventory_id :String?
    
    public func write_cart_to_db ()
    {
        if (self.currentUser_id == nil || self.inventory_id == nil)
        {
            print("Missing required Information")
            return;
        }
        else{
            let ref:DatabaseReference!
            ref = Database.database().reference(fromURL: "https://onroute-947cd.firebaseio.com/")
            let key = ref.child("Carts").childByAutoId().key
            let carts = ["currentUser" : currentUser_id , "inventory_id" : inventory_id]
            let childUpdates = ["/Carts/\(key)": carts, "/users-carts/\(String(describing: currentUser_id))/\(key)/": carts]
            ref.updateChildValues(childUpdates, withCompletionBlock: { (error, reference) in
                
            })

        }
    }
    
}
