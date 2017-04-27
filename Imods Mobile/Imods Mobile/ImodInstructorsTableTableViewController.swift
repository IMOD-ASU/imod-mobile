//
//  ImodInstructorsTableTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/27/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodInstructorsTableTableViewController: UITableViewController,
                                                SaveInstructorObjectViewControllerDelegate {

    // MARK: - SaveInstructorViewControllerDelegate Methods
    func saveInstructorObject(_ instructorObject: SInstructor, _ addInstructor: Bool) {
        if (addInstructor == true) {
            courseObject?.instructors.append(instructorObject)
        }
        saveDelegate.saveCourseObject(self.courseObject!)
        self.tableView.reloadData()
    }
    
    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    // MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (courseObject?.instructors.count)! > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return (courseObject?.instructors.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any instructors added to your course yet. \n You can start by clicking on the Add button at the top-right of your screen", viewController: self)
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstructorCellItem", for: indexPath)
        
        //Populating Instructor View Cell with the Instructor Name and Role Information
        cell.textLabel?.text = (courseObject?.instructors[indexPath.row].lastName)! + ", " + (courseObject?.instructors[indexPath.row].firstName)!
        cell.detailTextLabel?.text = instructorRoleList[(courseObject?.instructors[indexPath.row].role)!]
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            courseObject?.instructors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let mdvc = segue.destination as? ImodInstructorViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showInstructor":
                    let indexPath = self.tableView.indexPathForSelectedRow
                    mdvc.instructorObject = courseObject?.instructors[(indexPath?.row)!]
                    mdvc.saveInstructorDelegate = self
                    break;
                    
                case "addInstructor":
                    mdvc.instructorObject = SInstructor()
                    mdvc.addInstructor = true
                    mdvc.saveInstructorDelegate = self
                    break;
                    
                default : break //Do Nothing
                }
            }
        }
    }
}
