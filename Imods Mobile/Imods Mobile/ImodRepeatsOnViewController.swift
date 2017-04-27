//
//  ImodRepeatsOnViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/27/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveRepeatsOnViewControllerDelegate {
    func saveRepeatsOnObject(_ repeatsOnObject: [String])
}

class ImodRepeatsOnViewController: UITableViewController {

    // MARK: - Stored Properties
    var repeatsOn : [String]? = nil
    var saveRepeatsOnDelegate : SaveRepeatsOnViewControllerDelegate!
    
    // MARK: - IBActions
    @IBAction func doneActionClicked(_ sender: UIBarButtonItem) {
        // Saving RepeatsOn Object
        saveRepeatsOnDelegate.saveRepeatsOnObject(self.repeatsOn!)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repeatsOnList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repeatsOnCell", for: indexPath)
        
        // Fetch the Day Name
        let repeatsOnTitle = repeatsOnList[indexPath.row]
        cell.textLabel?.text = repeatsOnTitle
        
        // Based on the List Check or Uncheck
        if (self.repeatsOn?.contains(repeatsOnTitle))! {
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
                if (self.repeatsOn?.contains(repeatsOnList[indexPath.row]))! {
                    let index = self.repeatsOn?.index(of: repeatsOnList[indexPath.row])
                    self.repeatsOn?.remove(at: index!)
                    cell.accessoryType = .none
                }
                else {
                    self.repeatsOn?.append(repeatsOnList[indexPath.row])
                    cell.accessoryType = .checkmark
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
                }
            }
        }
    }
}
