//
//  LearningObjectives.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodLearningObjective {
    
    // MARK : - Objective Model
    var learningObjectiveTitle : String = ""
    
    var performanceString : String = ""
    var conditionString : String = ""
    var contentString : String = ""
    var criteriaString : String = ""
    
    var objectivePeformance : ImodObjectivePerformance = ImodObjectivePerformance()
    var objectiveCondition : ImodObjectiveCondition = ImodObjectiveCondition()
    var objectiveCriteria : ImodObjectiveCriteria = ImodObjectiveCriteria()
    var objectiveContent : [String] = [String]()
    
    init() {
        
    }
    
    init (managedObject: AnyObject) {
        // Populate the Objectives Data Accordingly from the Core Data
        self.learningObjectiveTitle = (managedObject.value(forKey: "objective") as? String)!
        self.performanceString = (managedObject.value(forKey: "performanceString") as? String)!
        self.conditionString = (managedObject.value(forKey: "conditionString") as? String)!
        self.contentString = (managedObject.value(forKey: "contentString") as? String)!
        self.criteriaString = (managedObject.value(forKey: "criteriaString") as? String)!
        
        // Fetch Performance Object
        let performanceObject = managedObject.value(forKey: "hasPerformance") as AnyObject
        var performance = ImodObjectivePerformance(managedObject: performanceObject)
        self.objectivePeformance = performance
        
        // Fetch Contents Object
        let contentsObjects = managedObject.mutableSetValue(forKey: "hasContent")
        for contentObject in contentsObjects {
            let newContentObject = ((contentObject as AnyObject).value(forKey: "contentTopic") as? String)!
            objectiveContent.append(newContentObject)
        }
        
        // Fetch Criteria Object
        let criteriaObject = managedObject.value(forKey: "hasCriteria") as AnyObject
        var criteria = ImodObjectiveCriteria(managedObject: criteriaObject)
        self.objectiveCriteria = criteria
        
        // Fetch Condition Object
        let conditionObject = managedObject.value(forKey: "hasCondition") as AnyObject
        var condition = ImodObjectiveCondition(managedObject: conditionObject)
        self.objectiveCondition = condition
    }
}

