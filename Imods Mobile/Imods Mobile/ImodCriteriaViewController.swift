//
//  ImodCriteriaViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveCriteriaObjectViewControllerDelegate {
    func saveCriteriaObject(_ criteriaObject: ImodObjectiveCriteria, _ criteriaString : String)
}

class ImodCriteriaViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Stored Properties
    var criteriaObject : ImodObjectiveCriteria? = nil
    var saveCriteriaDelegate : SaveCriteriaObjectViewControllerDelegate!
    
    var criteriaString: String = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var enableAccuracySwitch: UISwitch!
    @IBOutlet weak var enableQualitySwitch: UISwitch!
    @IBOutlet weak var enableQuantitySwitch: UISwitch!
    @IBOutlet weak var enableSpeedSwitch: UISwitch!
    
    @IBOutlet weak var accuracyTextField: UITextField!
    @IBOutlet weak var qualityTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    @IBOutlet weak var hideAccuracy: UISwitch!
    @IBOutlet weak var hideQuality: UISwitch!
    @IBOutlet weak var hideQuantity: UISwitch!
    @IBOutlet weak var hideSpeed: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func enableAccuracyAction(_ sender: UISwitch) {
        accuracyTextField.isEnabled = sender.isOn
        accuracyTextField.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func enableQualityAction(_ sender: UISwitch) {
        qualityTextField.isEnabled = sender.isOn
        qualityTextField.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func enableQuantityAction(_ sender: UISwitch) {
        quantityTextField.isEnabled = sender.isOn
        quantityTextField.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func enableSpeedAction(_ sender: UISwitch) {
        speedTextField.isEnabled = sender.isOn
        speedTextField.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func doneActionClicked(_ sender: UIBarButtonItem) {
        
        // Saving to Instructor Object
        saveToCriteriaObject()
        
        // Create Criteria String
        createCriteriaString()
        
        // Saving Performance Object
        saveCriteriaDelegate.saveCriteriaObject(self.criteriaObject!, self.criteriaString)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        accuracyTextField.delegate =    self
        qualityTextField.delegate =     self
        quantityTextField.delegate =    self
        speedTextField.delegate =       self
        
        // Setting TextViews Keyboard Styles
        accuracyTextField.keyboardType = UIKeyboardType.asciiCapable
        qualityTextField.keyboardType = UIKeyboardType.asciiCapable
        quantityTextField.keyboardType = UIKeyboardType.asciiCapable
        speedTextField.keyboardType = UIKeyboardType.asciiCapable
    }
    
    fileprivate func saveToCriteriaObject() {
        // Saving to Criteria Object
        criteriaObject?.enableAccuracy = enableAccuracySwitch.isOn
        criteriaObject?.accuracy = accuracyTextField.text!
        criteriaObject?.hideFromStudentsForAccuracy = hideAccuracy.isOn
        
        criteriaObject?.enableQuality = enableQualitySwitch.isOn
        criteriaObject?.quality = qualityTextField.text!
        criteriaObject?.hideFromStudentsForQuality = hideQuality.isOn
        
        criteriaObject?.enableQuantity = enableQuantitySwitch.isOn
        criteriaObject?.quantity = quantityTextField.text!
        criteriaObject?.hideFromStudentsForQuantity = hideQuantity.isOn
        
        criteriaObject?.enableSpeed = enableSpeedSwitch.isOn
        criteriaObject?.speed = speedTextField.text!
        criteriaObject?.hideFromStudentsForSpeed = hideSpeed.isOn
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating UI Objects
        enableAccuracySwitch.setOn((criteriaObject?.enableAccuracy)!, animated: true)
        enableAccuracyAction(enableAccuracySwitch)
        accuracyTextField.text = criteriaObject?.accuracy
        hideAccuracy.setOn((criteriaObject?.hideFromStudentsForAccuracy)!, animated: true)
        
        enableQualitySwitch.setOn((criteriaObject?.enableQuality)!, animated: true)
        enableQualityAction(enableQualitySwitch)
        qualityTextField.text = criteriaObject?.quality
        hideQuality.setOn((criteriaObject?.hideFromStudentsForQuality)!, animated: true)
        
        enableQuantitySwitch.setOn((criteriaObject?.enableQuantity)!, animated: true)
        enableQuantityAction(enableQuantitySwitch)
        quantityTextField.text = criteriaObject?.quantity
        hideQuantity.setOn((criteriaObject?.hideFromStudentsForQuantity)!, animated: true)
        
        enableSpeedSwitch.setOn((criteriaObject?.enableSpeed)!, animated: true)
        enableSpeedAction(enableSpeedSwitch)
        speedTextField.text = criteriaObject?.speed
        hideSpeed.setOn((criteriaObject?.hideFromStudentsForSpeed)!, animated: true)
    }
    
    fileprivate func createCriteriaString() {
        
        var criteriaString = ""
        var criteriaList : [String] = [String]()
        
        // Count the Criterias and add to List.
        if (enableAccuracySwitch.isOn && !hideAccuracy.isOn) {
            criteriaList.append(accuracyTextField.text! + " accuracy")
        }
        if (enableQualitySwitch.isOn && !hideQuality.isOn) {
            criteriaList.append(qualityTextField.text! + " quality")
        }
        if (enableQuantitySwitch.isOn && !hideQuantity.isOn) {
            criteriaList.append(quantityTextField.text! + " quantity")
        }
        if (enableSpeedSwitch.isOn && !hideSpeed.isOn) {
            criteriaList.append(speedTextField.text! + " speed")
        }
        
        // Creating the String
        if (criteriaList.count == 0) {
            criteriaString = "."
        }
        
        else if (criteriaList.count == 1) {
            criteriaString = "with " + criteriaList.popLast()! + "."
        }
        
        else {
            criteriaString = "with "
            while(criteriaList.count > 0) {
                if(criteriaList.count == 1) {
                    let range = criteriaString.index(criteriaString.endIndex, offsetBy: -2)..<criteriaString.endIndex
                    criteriaString.removeSubrange(range)
                    criteriaString = criteriaString.appending(" and " + criteriaList.popLast()! + ".")
                }
                else {
                    criteriaString = criteriaString.appending(criteriaList.popLast()! + ", ")
                }
            }
        }
        self.criteriaString = criteriaString
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        accuracyTextField.resignFirstResponder()
        qualityTextField.resignFirstResponder()
        quantityTextField.resignFirstResponder()
        speedTextField.resignFirstResponder()
        
        enableAccuracySwitch.resignFirstResponder()
        enableQualitySwitch.resignFirstResponder()
        enableQuantitySwitch.resignFirstResponder()
        enableSpeedSwitch.resignFirstResponder()
        
        hideAccuracy.resignFirstResponder()
        hideQuality.resignFirstResponder()
        hideQuantity.resignFirstResponder()
        hideSpeed.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case accuracyTextField:   qualityTextField.becomeFirstResponder(); break;
        case qualityTextField:    quantityTextField.becomeFirstResponder(); break;
        case quantityTextField:   speedTextField.becomeFirstResponder(); break;
        case speedTextField:      speedTextField.resignFirstResponder(); break;
        default: break;
        }
        return true
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
