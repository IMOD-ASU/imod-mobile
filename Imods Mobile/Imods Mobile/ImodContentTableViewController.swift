//
//  ImodContentTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

// MARK: - SaveLearningObjectiveViewControllerDelegate
protocol SaveObjectiveContentViewControllerDelegate {
    func saveObjectiveContent(_ learningObjectiveObject: ImodLearningObjective, _ contentString : String)
}

class ImodContentTableViewController: UITableViewController {

    // Stored Properties
    var learningObjective : ImodLearningObjective?
    var contentObject : [ImodContent]? = nil
    var saveObjectiveDelegate : SaveObjectiveContentViewControllerDelegate!
    
    var contentString : String = ""
    
    // MARK: - IBActions
    
    @IBAction func saveActionClicked(_ sender: UIBarButtonItem) {
        
        // Create Criteria String
        createContentString()
        
        // Saving Performance Object
        saveObjectiveDelegate.saveObjectiveContent(self.learningObjective!, self.contentString)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ViewController Private Methods
    fileprivate func createContentString() {
        var contentString = ""
        var contentList : [String] = (learningObjective?.objectiveContent)!
        
        // Creating the String
        if (contentList.count == 0) {
            contentString = ""
        }
            
        else if (contentList.count == 1) {
            contentString = contentList.popLast()!
        }
            
        else {
            contentString = ""
            while(contentList.count > 0) {
                if(contentList.count == 1) {
                    let range = contentString.index(contentString.endIndex, offsetBy: -2)..<contentString.endIndex
                    contentString.removeSubrange(range)
                    contentString = contentString.appending(" and " + contentList.popLast()!)
                }
                else {
                    contentString = contentString.appending(contentList.popLast()! + ", ")
                }
            }
        }
        self.contentString = contentString
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (contentObject?.count)! > 0 {
            return (contentObject?.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any contents added to your course to tag to your objectives. \n You can create them by clicking on Content in the IMODS Control Tab Screen", viewController: self)
            return 0
        }

        return (contentObject?.count) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectiveContentCellItem", for: indexPath)
        cell.textLabel?.text = contentObject?[indexPath.row].contentTopic
        
        // Based on the List Check or Uncheck
        if (learningObjective?.objectiveContent.contains((contentObject?[indexPath.row].contentTopic)!))! {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) {
            if cell.isSelected {
                cell.isSelected = false
                if (learningObjective?.objectiveContent.contains((contentObject?[indexPath.row].contentTopic)!))! {
                    let index = learningObjective?.objectiveContent.index(of: (contentObject?[indexPath.row].contentTopic)!)
                    learningObjective?.objectiveContent.remove(at: index!)
                    cell.accessoryType = .none
                }
                else {
                    learningObjective?.objectiveContent.append((contentObject?[indexPath.row].contentTopic)!)
                    cell.accessoryType = .checkmark
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
                }
            }
        }
    }
}
