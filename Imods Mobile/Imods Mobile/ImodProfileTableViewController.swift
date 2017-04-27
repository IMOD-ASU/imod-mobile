//
//  ImodProfileTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/20/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodProfileTableViewController: UITableViewController, SaveImodCourseDelegate {

    // MARK: - SaveInstructorViewControllerDelegate Methods
    func saveImodCourseObject(_ imodCourseObject: ImodCourse) {
        // Add User Model
        self.imodUserHolder?.addNewCourseForUser(newCourse: imodCourseObject)
        
        // Reload the Table
        self.tableView.reloadData()
    }
    
    // MARK: - Stored Properties
    var imodUserHolder : ImodLoginUserHolder? = nil
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.imodUserHolder?.selectedCourse == nil {
            if (imodUserHolder?.iUser?.imodCourses.count)! > 0 {
                self.imodUserHolder?.setSelectedCourse(index: 0)
                let indexPath = IndexPath(row: (self.imodUserHolder?.selectedCourseIndex)!, section: 0);
                self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
                self.tableView(self.tableView, didSelectRowAt: indexPath)
            }
        } else {
            let indexPath = IndexPath(row: (self.imodUserHolder?.selectedCourseIndex)!, section: 0);
            self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
            self.tableView(self.tableView, didSelectRowAt: indexPath)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (imodUserHolder?.iUser?.imodCourses.count)! > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return (imodUserHolder?.iUser?.imodCourses.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any courses added yet. \n You can start by clicking on the Add button at the top-right of your screen", viewController: self)
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImodProfileCellItem", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = imodUserHolder?.iUser?.imodCourses[indexPath.row].profileName
        
        // Based on Selection Checkmark the Option
        if (self.imodUserHolder?.selectedCourse?.profileName == self.imodUserHolder?.iUser?.imodCourses[indexPath.row].profileName) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        if cell.isSelected {
            cell.isSelected = false
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            imodUserHolder?.removeCourseFromUser(index: indexPath.row)
            
            // Reselect the first based on deletion
            if(self.imodUserHolder?.iUser?.imodCourses.count == 0) {
                self.imodUserHolder?.setSelectedCourse(index: nil)
            } else {
                self.imodUserHolder?.setSelectedCourse(index: 0)
                tableView.selectRow(at: IndexPath(row: 0, section: 0),
                                    animated: false, scrollPosition: UITableViewScrollPosition.bottom)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) {
            if cell.isSelected {
                cell.isSelected = false
                self.imodUserHolder?.setSelectedCourse(index: indexPath.row)
                cell.accessoryType = .checkmark
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) {
            cell.accessoryType = .none
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mdvc = segue.destination as? ImodProfileViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "addProfile":
                    mdvc.saveImodCourseDelegate = self
                    break;
                    
                default : break //Do Nothing
                }
            }
        }
    }
}
