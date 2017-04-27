//
//  ImodObjectiveCondition.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

enum ImodConditionType: Int {
    case Generic = 0, Custom
}

class ImodObjectiveCondition {
    var conditionType : ImodConditionType = ImodConditionType.Generic
    var condition : String = ""
    var hideFromStudents : Bool = false
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        // Populate the Condition Data Accordingly from the Core Data
        self.conditionType = ImodConditionType(rawValue: (managedObject.value(forKey: "conditionType") as? Int)!)!
        self.condition = (managedObject.value(forKey: "condition") as? String)!
        self.hideFromStudents = (managedObject.value(forKey: "hideFromStudents") as? Bool)!
    }
}
