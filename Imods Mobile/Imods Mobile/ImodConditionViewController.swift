//
//  ImodConditionViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveConditionObjectViewControllerDelegate {
    func saveConditionObject(_ conditionObject: ImodObjectiveCondition, _ conditionString : String)
}

class ImodConditionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Stored Properties
    var conditionObject : ImodObjectiveCondition? = nil
    var saveConditionDelegate : SaveConditionObjectViewControllerDelegate!
    
    var conditionString : String = ""
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var ObjectiveConditionOption: UISegmentedControl!
    @IBOutlet weak var objectiveConditionTextView: UITextView!
    @IBOutlet weak var conditionVisibility: UISwitch!
    @IBOutlet weak var conditionPicker: UIPickerView!
    
    // MARK: - IBAction
    
    @IBAction func doneObjectClicked(_ sender: UIBarButtonItem) {
        
        // Saving to Instructor Object
        saveToConditionObject()
        
        // Updating Condition String
        if (!conditionVisibility.isOn) {
            self.conditionString = objectiveConditionTextView.text!
        }
        
        // Saving Performance Object
        saveConditionDelegate.saveConditionObject(self.conditionObject!, self.conditionString)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func conditionSelectedAction(_ sender: UISegmentedControl) {
        if (ObjectiveConditionOption.selectedSegmentIndex == 0) {
            objectiveConditionTextView.inputView = conditionPicker
            
        } else if(ObjectiveConditionOption.selectedSegmentIndex == 1) {
            objectiveConditionTextView.inputView = nil
            objectiveConditionTextView.text = ""
        }
    }
    
    // MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Audience PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Update the UI Elements from the Course Object
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    fileprivate func onSetPickerViewDelegates() {
        conditionPicker.dataSource = self
        conditionPicker.delegate = self
        conditionPicker.removeFromSuperview()
        objectiveConditionTextView.inputView = conditionPicker
    }
    
    fileprivate func saveToConditionObject() {
        // Saving to Condition Object
        conditionObject?.condition = objectiveConditionTextView.text!
        conditionObject?.conditionType = (ObjectiveConditionOption.selectedSegmentIndex == 0) ? .Generic : .Custom
        conditionObject?.hideFromStudents = conditionVisibility.isOn
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        ObjectiveConditionOption.selectedSegmentIndex = (conditionObject?.conditionType == .Generic) ? 0 : 1;
        self.conditionSelectedAction(self.ObjectiveConditionOption)
        objectiveConditionTextView.text = conditionObject?.condition
        conditionVisibility.setOn((conditionObject?.hideFromStudents)!, animated: true)
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ObjectiveConditionOption.resignFirstResponder()
        objectiveConditionTextView.resignFirstResponder()
        conditionVisibility.resignFirstResponder()
        conditionVisibility.resignFirstResponder()
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        objectiveConditionTextView.text = objectiveConditionList[row]
        objectiveConditionTextView.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return objectiveConditionList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return objectiveConditionList[row]
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
