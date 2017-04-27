//
//  ImodLearningObjectivesTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodLearningObjectivesTableViewController: UITableViewController,
                                                    SaveLearningObjectiveViewControllerDelegate {
    
    // MARK: - SaveLearningObjectiveViewControllerDelegate Methods
    func saveLearningObjectiveObject(_ learningObjectiveObject: ImodLearningObjective, _ addObjective: Bool) {
        if (addObjective == true) {
            courseObject?.learningObjectives.append(learningObjectiveObject)
        }
        saveDelegate.saveCourseObject(self.courseObject!)
        self.tableView.reloadData()
    }
    
    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    // MARK: - ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (courseObject?.learningObjectives.count)! > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return (courseObject?.learningObjectives.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any learning objectives added to your course yet. \n You can start by clicking on the Add button at the top-right of your screen", viewController: self)
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LearningObjectiveCellItem", for: indexPath)
        cell.textLabel?.text = courseObject?.learningObjectives[indexPath.row].learningObjectiveTitle
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            courseObject?.learningObjectives.remove(at: indexPath.row)
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
        if let mdvc = segue.destination as? ImodLearningObjectiveViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showObjective":
                    let indexPath = self.tableView.indexPathForSelectedRow
                    mdvc.learningObjective = courseObject?.learningObjectives[(indexPath?.row)!]
                    mdvc.contentObject = courseObject?.courseContents
                    mdvc.saveObjectiveDelegate = self
                    break;
                    
                case "addObjective":
                    mdvc.learningObjective = ImodLearningObjective()
                    mdvc.contentObject = courseObject?.courseContents
                    mdvc.addObjective = true
                    mdvc.saveObjectiveDelegate = self
                    break;
                    
                default : break //Do Nothing
                }
            }
        }
    }
}
