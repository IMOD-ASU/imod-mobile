//
//  ImodObjectiveCriteria.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodObjectiveCriteria {
    // Accuracy
    var enableAccuracy : Bool = false
    var accuracy : String = ""
    var hideFromStudentsForAccuracy = false
    
    // Quality
    var enableQuality : Bool = false
    var quality : String = ""
    var hideFromStudentsForQuality = false
    
    // Quantity
    var enableQuantity : Bool = false
    var quantity : String = ""
    var hideFromStudentsForQuantity = false
    
    // Speed
    var enableSpeed : Bool = false
    var speed : String = ""
    var hideFromStudentsForSpeed = false
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        // Populate the Criteria Data Accordingly from the Core Data
        self.enableAccuracy = (managedObject.value(forKey: "enableAccuracy") as? Bool)!
        self.accuracy = (managedObject.value(forKey: "accuracy") as? String)!
        self.hideFromStudentsForAccuracy = (managedObject.value(forKey: "hideAccuracy") as? Bool)!
        
        self.enableQuality = (managedObject.value(forKey: "enableQuality") as? Bool)!
        self.quality = (managedObject.value(forKey: "quality") as? String)!
        self.hideFromStudentsForQuality = (managedObject.value(forKey: "hideQuality") as? Bool)!
        
        self.enableQuantity = (managedObject.value(forKey: "enableQuantity") as? Bool)!
        self.quantity = (managedObject.value(forKey: "quantity") as? String)!
        self.hideFromStudentsForQuantity = (managedObject.value(forKey: "hideQuantity") as? Bool)!
        
        self.enableSpeed = (managedObject.value(forKey: "enableSpeed") as? Bool)!
        self.speed = (managedObject.value(forKey: "speed") as? String)!
        self.hideFromStudentsForSpeed = (managedObject.value(forKey: "hideSpeed") as? Bool)!
    }
}
