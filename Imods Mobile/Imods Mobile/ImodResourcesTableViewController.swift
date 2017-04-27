//
//  ImodResourcesTableViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveResourcesViewControllerDelegate {
    func saveResourcesObject(_ contentObject: ImodContent)
}

class ImodResourcesTableViewController: UITableViewController,
                                        SaveResourceViewControllerDelegate {

    // MARK: - SaveResourceViewControllerDelegate Methods
    func saveResourceObject(_ resourceObject: ImodResource, _ addResource: Bool) {
        if (addResource == true) {
            contentObject?.contentResources.append(resourceObject)
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Stored Properties
    var contentObject : ImodContent? = nil
    var saveResourcesObject : SaveResourcesViewControllerDelegate!
    
    // MARK: - ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (contentObject?.contentResources.count)! > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return (contentObject?.contentResources.count)!
        } else {
            TableViewHelper.EmptyMessage(message: "You don't have any resources added to your content topic yet. \n You can start by clicking on the Add button at the top-right of your screen", viewController: self)
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResourceCellItem", for: indexPath)
        cell.textLabel?.text = self.contentObject?.contentResources[indexPath.row].resourceTitle
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.contentObject?.contentResources.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mdvc = segue.destination as? ImodResourceViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showResource":
                    let indexPath = self.tableView.indexPathForSelectedRow
                    mdvc.resourceObject = contentObject?.contentResources[(indexPath?.row)!]
                    mdvc.saveResourceDelegate = self
                    break;
                    
                case "addResource":
                    mdvc.resourceObject = ImodResource()
                    mdvc.addResource = true
                    mdvc.saveResourceDelegate = self
                    break;
                    
                default : break //Do Nothing
                }
            }
        }
    }
}
