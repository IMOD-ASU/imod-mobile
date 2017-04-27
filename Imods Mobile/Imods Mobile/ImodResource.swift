//
//  ImodResource.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodResource {

    // MARK : - Resource Model
    var resourceTitle : String = ""
    var resourceDescription : String = ""
    var resourceType : Int = 0
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        // Populate the Resource Data accordingly from the Core Data
        self.resourceTitle = (managedObject.value(forKey: "title") as? String)!
        self.resourceDescription = (managedObject.value(forKey: "resourceDescription") as? String)!
        self.resourceType = (managedObject.value(forKey: "resourceType") as? Int)!
    }
}
