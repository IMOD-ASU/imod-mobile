//
//  ImodKnowledgeDimensionViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveKnowledgeDimensionsObjectViewControllerDelegate {
    func saveKnowledgeDimensionsObject(_ knowledgeDimensionsObject: [String])
}

class ImodKnowledgeDimensionViewController: UITableViewController {

    // MARK: - Stored Properties
    var knowledgeDimensions : [String]? = nil
    var saveKnowledgeDimensionsDelegate : SaveKnowledgeDimensionsObjectViewControllerDelegate!
    
    // MARK: - IBActions
    
    @IBAction func doneActionClicked(_ sender: UIBarButtonItem) {
        // Saving KnowledgeDimensions Object
        saveKnowledgeDimensionsDelegate.saveKnowledgeDimensionsObject(self.knowledgeDimensions!)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knowledgeDimensionsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "knowledgeDimensionCell", for: indexPath)
        
        // Fetch the Knowledge Dimension Name
        let knowledgeDim = knowledgeDimensionsList[indexPath.row]
        cell.textLabel?.text = knowledgeDim
        
        // Based on the List Check or Uncheck
        if (knowledgeDimensions?.contains(knowledgeDim))! {
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
                if (knowledgeDimensions?.contains(knowledgeDimensionsList[indexPath.row]))! {
                    let index = knowledgeDimensions?.index(of: knowledgeDimensionsList[indexPath.row])
                    knowledgeDimensions?.remove(at: index!)
                    cell.accessoryType = .none
                }
                else {
                    knowledgeDimensions?.append(knowledgeDimensionsList[indexPath.row])
                    cell.accessoryType = .checkmark
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
                }
            }
        }
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
