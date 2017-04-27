//
//  ImodsMasterViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/9/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodsMasterViewController: UITableViewController, SaveCourseObjectViewControllerDelegate {

    // MARK: - SaveCourseObjectViewControllerDelegate Methods
    func saveCourseObject(_ courseObject: ImodCourse) {
        self.imodUserHolder?.saveCourseAfterChanges(changedCourseObject: courseObject)
    }

    // MARK: - IModsMasterView Stored Properties
    var imodUserHolder : ImodLoginUserHolder? = nil
    
    // MARK: - IModsMasterView ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IModsMasterView ViewController Private Methods
    fileprivate func alertNoCourse() {
        let alert = UIAlertController(title: "Message to User", message: "Course is either not selected or added in My-imods.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - IModsMasterView ViewController TableView Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return masterTableName.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterDetailView[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath)
        
        //Populating Master View Cell with the Menu Information
        cell.textLabel?.text = masterDetailView[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return masterTableName[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = indexPath
        
        switch (path.section) {
            
        //My Imods
        case 0 :
            // Imod Profiles or My-Imods
            if(path.row == 0) {
                let viewController = storyboard?.instantiateViewController(withIdentifier: "showImodProfiles")
                
                // Initialize the View Controller Values
                let vc = viewController as? ImodProfileTableViewController
                vc?.imodUserHolder = self.imodUserHolder
                self.navigationController?.pushViewController(viewController!, animated: true)
            }
            break;
            
        //Course Overview
        case 1 :
            // Course Details
            if (path.row == 0) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showCourseDetail")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodCourseDetailsViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
                
                // Course Description
            else if (path.row == 1) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showCourseDescription")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodCourseDescriptionViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
                
                // Course Schedule
            else if (path.row == 2)  {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showCourseSchedule")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodScheduleViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
                
                // Course Policy
            else if(path.row == 3) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showCoursePolicy")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodCoursePolicyViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
                
                // Course Instructors
            else if(path.row == 4) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showCourseInstructorTable")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodInstructorsTableTableViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
            break
            
        //Learning Objectives
        case 2 :
            // Learning Objectives
            if(path.row == 0) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showLearningObjectives")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodLearningObjectivesTableViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
            break;
                
        //Content
        case 3 :
            // Main Contents
            if(path.row == 0) {
                if self.imodUserHolder?.selectedCourse != nil {
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "showMainContents")
                    
                    // Initialize the View Controller Values
                    let vc = viewController as? ImodMainContentsTableViewController
                    vc?.courseObject = self.imodUserHolder?.selectedCourse
                    vc?.saveDelegate = self
                    self.navigationController?.pushViewController(viewController!, animated: true)
                } else {
                    self.alertNoCourse()
                }
            }
            break
            
        //Log Out
        case 4 :
            exit(0)
            break
            
        default:
            break
            // Do Nothing
        }
    }
}
