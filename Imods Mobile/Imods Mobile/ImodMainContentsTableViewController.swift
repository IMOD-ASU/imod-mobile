//
//  ImodMainContentTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodMainContentsTableViewController: UITableViewController, SaveContentViewControllerDelegate {

    // MARK: - SaveContentViewControllerDelegate Methods
    func saveContentObject(_ courseContentObject: ImodContent, _ addContent: Bool) {
        if (addContent == true) {
            courseObject?.courseContents.append(courseContentObject)
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        if (courseObject?.courseContents.count)! > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return (courseObject?.courseContents.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any contents added to your course yet. \n You can start by clicking on the Add button at the top-right of your screen", viewController: self)
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCellItem", for: indexPath)
        cell.textLabel?.text = courseObject?.courseContents[indexPath.row].contentTopic
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            courseObject?.courseContents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mdvc = segue.destination as? ImodMainContentViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showContent":
                    let indexPath = self.tableView.indexPathForSelectedRow
                    mdvc.courseContent = courseObject?.courseContents[(indexPath?.row)!]
                    mdvc.saveContentDelegate = self
                    break;
                    
                case "addContent":
                    mdvc.courseContent = ImodContent()
                    mdvc.addContent = true
                    mdvc.saveContentDelegate = self
                    break;
                    
                default : break //Do Nothing
                }
            }
        }
    }
}
