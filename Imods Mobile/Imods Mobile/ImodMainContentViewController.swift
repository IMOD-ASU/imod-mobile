//
//  ImodMainContentViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

// MARK: - SaveLearningObjectiveViewControllerDelegate
protocol SaveContentViewControllerDelegate {
    func saveContentObject(_ courseContentObject: ImodContent, _ addContent: Bool)
}

class ImodMainContentViewController: UITableViewController,
                                        SaveKnowledgeDimensionsObjectViewControllerDelegate,
                                        SavePriorityObjectViewControllerDelegate,
                                        SaveResourcesViewControllerDelegate{

    // MARK: - Save KnowledgeDimensions Object
    func saveKnowledgeDimensionsObject(_ knowledgeDimensionsObject: [String]) {
        self.courseContent?.contentKnowledgeDimensions = knowledgeDimensionsObject
    }
    
    // MARK: - SavePriorityObjectViewControllerDelegate
    func savePriorityObject(_ priorityObject: String) {
        self.courseContent?.contentPriority = priorityObject
    }
    
    // MARK: - SaveResourcesViewControllerDelegate
    func saveResourcesObject(_ contentObject: ImodContent) {
        self.courseContent = contentObject
    }
    
    // MARK: - Stored Properties
    var courseContent : ImodContent? = nil
    var saveContentDelegate : SaveContentViewControllerDelegate!
    var addContent : Bool = false

    // MARK: - IBOutlets
    @IBOutlet weak var contentTopicTextField: UITextField!
    @IBOutlet weak var contentPreReqSwitch: UISwitch!
    
    // MARK: - IBActions
    @IBAction func saveContentAction(_ sender: UIBarButtonItem) {
        if((self.contentTopicTextField.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Content Topic should not be Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            //Updating the Content Topic
            courseContent?.contentTopic = contentTopicTextField.text!
            courseContent?.contentPreReq = contentPreReqSwitch.isOn
            
            // Saving Performance Object
            saveContentDelegate.saveContentObject(self.courseContent!, self.addContent)
            
            // Pop to Previous View Controller
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the Tableview Cell Seperator Style
        self.tableView.separatorStyle = .none
        
        // Update the UI Elements from the Content Object
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - ViewController Private Methods
    fileprivate func updateUI() {
        contentTopicTextField.text = courseContent?.contentTopic
        contentPreReqSwitch.setOn((courseContent?.contentPreReq)!, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "showKnowledgeDimension":
                    if let mdvc = segue.destination as? ImodKnowledgeDimensionViewController {
                        mdvc.knowledgeDimensions = self.courseContent?.contentKnowledgeDimensions
                        mdvc.saveKnowledgeDimensionsDelegate = self
                    }
                    break;
                    
                case "showPriority":
                    if let mdvc = segue.destination as? ImodPriorityViewController {
                        mdvc.priorityObject = (self.courseContent?.contentPriority)!
                        mdvc.savePriorityDelegate = self
                    }
                    break;
                    
                case "showResources":
                    if let mdvc = segue.destination as? ImodResourcesTableViewController {
                        mdvc.contentObject = self.courseContent
                        mdvc.saveResourcesObject = self
                    }
                    break;
                    
                default : break //Do Nothing
            }
        }
    }

}
