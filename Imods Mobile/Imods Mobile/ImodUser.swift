//
//  ImodUser.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/20/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation
import CoreData

class ImodUser {
    
    // MARK: - Model Class Properties
    var username : String = ""
    var password : String = ""
    
    var imodCourses : [ImodCourse] = [ImodCourse]()
    
    // MARK: - Model Constructors
    init() {
        
    }
    
    init(managedObject: NSManagedObject?) {
        
        // Populate the Username and Password Field
        username = managedObject?.value(forKey: "username") as! String
        password = managedObject?.value(forKey: "password") as! String
        
        // Fetch the imodProfiles for all the User
        let courses = managedObject?.mutableSetValue(forKey: "hasProfiles")
        
        // Populate all the Courses created by the user.
        for courseDB in courses! {
            var course = ImodCourse(managedObject: (courseDB as AnyObject))
            self.imodCourses.append(course)
        }
    }
    
    init(username: String, password: String) {
        // Populate the values for the object
        self.username = username
        self.password = password
    }
    
    // MARK: - Model Public Methods
    func createUserForDB(managedObjectContext : NSManagedObjectContext?) -> NSManagedObject {
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext!)
        let user = NSManagedObject(entity: userEntity!, insertInto: managedObjectContext!)
        user.setValue(self.username, forKey: "username")
        user.setValue(self.password, forKey: "password")
        return user
    }
}
