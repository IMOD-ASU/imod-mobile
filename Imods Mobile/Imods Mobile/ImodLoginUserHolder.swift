//
//  ImodLoginUserHolder.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/24/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation
import CoreData

class ImodLoginUserHolder {
    
    // MARK: - Model Properties
    var iUser : ImodUser? = nil
    var managedObjectContext : NSManagedObjectContext? = nil
    
    var selectedCourseIndex : Int? = nil
    var selectedCourse : ImodCourse? = nil
    var selectedProfileName : String = ""
    
    // MARK: - Model Constructors
    init() {
        
    }
    
    init(username: String, password: String, newManagedObjectContext : NSManagedObjectContext) {
        self.managedObjectContext = newManagedObjectContext
        self.fetchUser(username: username, password: password)
    }
    
    // MARK: - Model Private Methods
    
    // Method to fetch login user from Core Data and load accordingly
    func fetchUser(username: String, password: String) {
        
        // Check whether user is present in Core Data or not
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let usernamePredicate = NSPredicate(format: "username = %@", username)
        let passwordPredicate = NSPredicate(format: "password = %@", password)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate, passwordPredicate])
        fetchRequest.predicate = andPredicate
        
        // Perform Fetch
        var iUserResult : [NSManagedObject]? = nil
        do {
            let fetchResult = try(self.managedObjectContext?.fetch(fetchRequest))
            iUserResult = (fetchResult as? [NSManagedObject])!
        } catch let error {
            print(error)
        }
        
        // Identify the whether the user is present or not.
        if (iUserResult?.count)! > 0 {
            var newUser = ImodUser(managedObject: iUserResult?[0])
            self.iUser = newUser
        } else {
            var newUser = ImodUser(username: username, password: password)
            self.iUser = newUser
        }
    }
    
    // MARK: - Model Public Methods

    // Method to remove course from CoreData DB
    fileprivate func removeCourseDB(profileName : String) {
        // Prepare Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let usernamePredicate = NSPredicate(format: "username = %@", (self.iUser?.username)!)
        let passwordPredicate = NSPredicate(format: "password = %@", (self.iUser?.password)!)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate, passwordPredicate])
        fetchRequest.predicate = andPredicate
        
        // Perform Fetch
        var iUserResult : [NSManagedObject]? = nil
        do {
            let fetchResult = try(self.managedObjectContext?.fetch(fetchRequest))
            iUserResult = (fetchResult as? [NSManagedObject])!
        } catch let error {
            print(error)
        }
        
        // Identify the Course Object to be removed
        if (iUserResult?.count)! == 1 {
            // Assuming it is only for one user
            let courseObjects = (iUserResult! as [AnyObject])[0].mutableSetValue(forKey: "hasProfiles")
            for iCourse in courseObjects {
                if profileName == (iCourse as! NSManagedObject).value(forKey: "profileName") as! String {
                    courseObjects.remove(iCourse)
                    (iUserResult! as [AnyObject])[0].setValue(courseObjects, forKey: "hasProfiles")
                    self.managedObjectContext?.delete(iCourse as! NSManagedObject)
                    return
                }
            }
        }
    }

    // Method to add new course to Core Data DB
    fileprivate func addNewCourseForUserDB(newCourseObjectDB: NSManagedObject) {
        // Prepare Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let usernamePredicate = NSPredicate(format: "username = %@", (self.iUser?.username)!)
        let passwordPredicate = NSPredicate(format: "password = %@", (self.iUser?.password)!)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate, passwordPredicate])
        fetchRequest.predicate = andPredicate
        
        // Perform Fetch
        var iUserResult : [NSManagedObject]? = nil
        do {
            let fetchResult = try(self.managedObjectContext?.fetch(fetchRequest))
            iUserResult = (fetchResult as? [NSManagedObject])!
        } catch let error {
            print(error)
        }
        
        // Identify the Course Object to be removed
        if (iUserResult?.count)! == 1 {
            // Assuming it is only for one user
            let fetchedCourses = (((iUserResult! as [AnyObject])[0])).mutableSetValue(forKey: "hasProfiles")
            fetchedCourses.add(newCourseObjectDB)
        }
    }

    // Method to save DB changes to Context
    fileprivate func saveDB() {
        // Saving Data to CoreData
        do {
            try self.managedObjectContext!.save()
        } catch (let error as NSError) {
            print("Error:\n \(error)")
        }
    }
    
    // Method to save Course Object to Local Model
    fileprivate func saveToLocalModel(changedCourse: ImodCourse) {
        // Index the Courses in the iUser Object and store accordingly.
        var index = 0
        for courseObject in (self.iUser?.imodCourses)! {
            if(courseObject.profileName == self.selectedProfileName) {
                self.iUser?.imodCourses[index] = changedCourse
            }
            index += 1
        }
    }
    
    // MARK: - Model Public Methods
    
    // Method to select the user selected course
    func setSelectedCourse(index : Int?) {
        if (index != nil) {
            self.selectedCourseIndex = index
            self.selectedCourse = self.iUser?.imodCourses[index!]
            self.selectedProfileName = (self.selectedCourse?.profileName)!
        } else {
            self.selectedCourseIndex = nil
            self.selectedCourse = nil
            self.selectedProfileName = ""
        }
    }
    
    // Method to remove course from the user
    func removeCourseFromUser(index : Int?) {
        // Remove the Course for Real Model
        self.iUser?.imodCourses.remove(at: index!)
        
        // Remove the Course from Coure Data DB
        self.removeCourseDB(profileName: (self.selectedProfileName))
        
        // Save the Core Data after removing
        self.saveDB()
    }
    
    // Method to add a new course to the courses list
    func addNewCourseForUser(newCourse : ImodCourse) {
        // Add the new Course to real model
        self.iUser?.imodCourses.append(newCourse)
        
        // Add the new CourseDB to Core Data
        var newCourseDB = newCourse.createCourseForDB(managedObjectContext: self.managedObjectContext)
        self.addNewCourseForUserDB(newCourseObjectDB: newCourseDB)
        
        // Save the Core Data after adding
        self.saveDB()
    }
    
    func saveCourseAfterChanges(changedCourseObject: ImodCourse) {
        
        // Save the changed course object in the new accessable model.
        self.saveToLocalModel(changedCourse: changedCourseObject)
        
        // Obtain the changed course object for Core Data from the course object and store it in the Persistence Container
        let newCourseObjectDB = changedCourseObject.createCourseForDB(managedObjectContext: self.managedObjectContext!)
        self.removeCourseDB(profileName: self.selectedProfileName)
        
        // Save it to the Core Data
        self.saveDB()
        
        // Add the new course object to CoreData.
        self.addNewCourseForUserDB(newCourseObjectDB: newCourseObjectDB)
        
        // Save it to the Core Data
        self.saveDB()
        
        // Set the selected course objects as required.
        self.setSelectedCourse(index: self.selectedCourseIndex!)
    }
}
