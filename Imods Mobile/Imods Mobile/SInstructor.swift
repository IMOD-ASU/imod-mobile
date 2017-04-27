//
//  Instructor.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/9/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class SInstructor {
 
    // MARK : - Instructor Model
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var officeHours : String = ""
    var webPage : String = ""
    var role : Int = 0
    var officeLocation : String = ""
    
    init() {
        
    }
    
    init(managedObject: AnyObject) {
        // Populate the Instructor Data Accordingly from the Core Data
        self.firstName = (managedObject.value(forKey: "firstName") as? String)!
        self.lastName = (managedObject.value(forKey: "lastName") as? String)!
        self.email = (managedObject.value(forKey: "email") as? String)!
        self.officeHours = (managedObject.value(forKey: "OfficeHours") as? String)!
        self.webPage = (managedObject.value(forKey: "webPage") as? String)!
        self.role = (managedObject.value(forKey: "role") as? Int)!
        self.officeLocation = (managedObject.value(forKey: "officeLocation") as? String)!
    }
    
}
