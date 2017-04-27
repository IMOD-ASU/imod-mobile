//
//  ImodPriorityViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SavePriorityObjectViewControllerDelegate {
    func savePriorityObject(_ priorityObject: String)
}

class ImodPriorityViewController: UITableViewController {

    // MARK: - Stored Properties
    var priorityObject : String = ""
    var savePriorityDelegate : SavePriorityObjectViewControllerDelegate!
    
    // MARK: - IBActions
    
    @IBAction func doneActionClicked(_ sender: UIBarButtonItem) {
        // Saving Priority Object
        savePriorityDelegate.savePriorityObject(self.priorityObject)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if priorityObject.isEmpty {
            priorityObject = priorityList[2]
        }
        let indexPath = IndexPath(row: priorityList.index(of: priorityObject)!, section: 0);
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        self.tableView(self.tableView, didSelectRowAt: indexPath)
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
        return priorityList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priorityCellItem", for: indexPath)

        // Based on the List Check or Uncheck
        cell.textLabel?.text = priorityList[indexPath.row]
        
        // Based on Selection Checkmark the Option
        if (self.priorityObject == priorityList[indexPath.row]) {
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) {
            if cell.isSelected {
                cell.isSelected = false
                self.priorityObject = priorityList[indexPath.row]
                cell.accessoryType = .checkmark
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) {
            cell.accessoryType = .none
        }
    }
}
