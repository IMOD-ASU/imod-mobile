//
//  ImodLearningObjectiveViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/3/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

// MARK: - SaveLearningObjectiveViewControllerDelegate
protocol SaveLearningObjectiveViewControllerDelegate {
    func saveLearningObjectiveObject(_ learningObjectiveObject: ImodLearningObjective, _ addObjective: Bool)
}

class ImodLearningObjectiveViewController: UITableViewController,
                                                SavePerformanceObjectViewControllerDelegate,
                                                SaveConditionObjectViewControllerDelegate,
                                                SaveCriteriaObjectViewControllerDelegate,
                                                SaveObjectiveContentViewControllerDelegate {
    
    // MARK: - Save Performance Object
    func savePerformanceObject(_ performanceObject: ImodObjectivePerformance, _ performanceString : String) {
        self.learningObjective?.objectivePeformance = performanceObject
        self.performanceString = performanceString
        updateObjectiveTitle()
    }
    
    // MARK: - Save Condition Object
    func saveConditionObject(_ conditionObject: ImodObjectiveCondition, _ conditionString : String) {
        self.learningObjective?.objectiveCondition = conditionObject
        self.conditionString = conditionString
        updateObjectiveTitle()
    }
    
    // MARK: - Save Criteria Object
    func saveCriteriaObject(_ criteriaObject: ImodObjectiveCriteria, _ criteriaString : String) {
        self.learningObjective?.objectiveCriteria = criteriaObject
        self.criteriaString = criteriaString
        updateObjectiveTitle()
    }
    
    // MARK: - Save Content Object
    func saveObjectiveContent(_ learningObjectiveObject: ImodLearningObjective, _ contentString : String) {
        self.learningObjective = learningObjectiveObject
        self.contentString = contentString
        updateObjectiveTitle()
    }
    
    // MARK: - Stored Properties
    var learningObjective : ImodLearningObjective? = nil
    var saveObjectiveDelegate : SaveLearningObjectiveViewControllerDelegate!
    var addObjective : Bool = false
    
    var contentObject : [ImodContent]? = nil
    
    var performanceString : String = ""
    var contentString : String = ""
    var conditionString : String = ""
    var criteriaString : String = ""

    // MARK: - IBOutlets
    @IBOutlet weak var learningObjectiveTextView: UITextView!
    
    // MARK: - IBActions
    @IBAction func saveObjectiveAction(_ sender: UIBarButtonItem) {
        if((self.learningObjectiveTextView.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Objective Statement should not be Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            //Updating the Objective Title and Other Parameters
            learningObjective?.learningObjectiveTitle = learningObjectiveTextView.text!
            learningObjective?.performanceString = self.performanceString
            learningObjective?.conditionString = self.conditionString
            learningObjective?.criteriaString = self.criteriaString
            learningObjective?.contentString = self.contentString
            
            // Saving Performance Object
            saveObjectiveDelegate.saveLearningObjectiveObject(self.learningObjective!, self.addObjective)
            
            // Pop to Previous View Controller
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the Tableview Cell Seperator Style
        self.tableView.separatorStyle = .none
        
        // Update the UI Elements from the Learning Objective Object
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Controller Private Methods
    fileprivate func updateUI() {
        learningObjectiveTextView.text = learningObjective?.learningObjectiveTitle
        
        self.performanceString = (learningObjective?.performanceString)!
        self.conditionString = (learningObjective?.conditionString)!
        self.contentString = (learningObjective?.contentString)!
        self.criteriaString = (learningObjective?.criteriaString)!
    }
    
    fileprivate func updateObjectiveTitle() {
        learningObjectiveTextView.text = conditionString + " " + performanceString + " " + contentString + " " + criteriaString
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showPerformance":
                if let mdvc = segue.destination as? ImodPerformanceViewController {
                  mdvc.performanceObject = self.learningObjective?.objectivePeformance
                  mdvc.savePerformanceDelegate = self
                }
                break;
            
            case "showCondition":
                if let mdvc = segue.destination as? ImodConditionViewController {
                    mdvc.conditionObject = self.learningObjective?.objectiveCondition
                    mdvc.saveConditionDelegate = self
                }
                break;
                
            case "showCriteria":
                if let mdvc = segue.destination as? ImodCriteriaViewController {
                    mdvc.criteriaObject = self.learningObjective?.objectiveCriteria
                    mdvc.saveCriteriaDelegate = self
                }
                break;
            
            case "showContent":
                if let mdvc = segue.destination as? ImodContentTableViewController {
                    mdvc.learningObjective = self.learningObjective
                    mdvc.contentObject = self.contentObject
                    mdvc.saveObjectiveDelegate = self
                }
                break;
                    
            default : break //Do Nothing
            }
        }
    }
}
