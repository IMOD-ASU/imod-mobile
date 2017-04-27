//
//  ImodContent.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodContent {
    
    // MARK : - Content Model
    var contentTopic : String = ""
    var contentKnowledgeDimensions = [String]()
    var contentPriority = ""
    var contentResources = [ImodResource]()
    var contentPreReq : Bool = false
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        
        // Populate the Main Contents Data Accordingly from the Core Data
        self.contentTopic = (managedObject.value(forKey: "topic") as? String)!
        self.contentPriority = (managedObject.value(forKey: "priority") as? String)!
        self.contentPreReq = (managedObject.value(forKey: "preReq") as? Bool)!
        
        // Populate Knowledge Dimensions
        let knowledgeDimensionsDB = (managedObject.mutableSetValue(forKey: "hasKnowledgeDimensions"))
        for knowledgeDimensionDB in knowledgeDimensionsDB {
            let knowledgeDimension = ((knowledgeDimensionDB as AnyObject).value(forKey: "knowledgeDimension") as? String)!
            contentKnowledgeDimensions.append(knowledgeDimension)
        }
        
        // Populate Resources
        let resourcesDB = (managedObject.mutableSetValue(forKey: "hasResources"))
        for resourceDB in resourcesDB {
            let resource = ImodResource(managedObject: resourceDB as AnyObject)
            self.contentResources.append(resource)
        }
    }
}
