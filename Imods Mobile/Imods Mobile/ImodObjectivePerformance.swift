//
//  ImodObjectivePerformance.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodObjectivePerformance {
    
    var learningDomain : String = ""
    var domainCategory : String = ""
    var actionWordCategory : String = ""
    var actionWord : String = ""
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        // Populate the Performance Data Accordingly from the Core Data
        self.learningDomain = (managedObject.value(forKey: "learningDomain") as? String)!
        self.domainCategory = (managedObject.value(forKey: "domainCategory") as? String)!
        self.actionWordCategory = (managedObject.value(forKey: "actionCategory") as? String)!
        self.actionWord = (managedObject.value(forKey: "actionWord") as? String)!
    }
}
