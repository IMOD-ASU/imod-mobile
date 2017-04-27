//
//  ImodPerformanceViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SavePerformanceObjectViewControllerDelegate {
    func savePerformanceObject(_ performanceObject: ImodObjectivePerformance, _ performanceString : String)
}

class ImodPerformanceViewController: UIViewController, UITextFieldDelegate,
                                        UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Stored Properties
    let performanceLogic = ImodPerformanceLogic()
    var performanceObject : ImodObjectivePerformance? = nil
    var savePerformanceDelegate : SavePerformanceObjectViewControllerDelegate!
    
    var performanceString : String = ""
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var learningDomainTextField: UITextField!
    @IBOutlet weak var domainCategoryTextField: UITextField!
    @IBOutlet weak var actionWordCategoryTextField: UITextField!
    @IBOutlet weak var actionWordTextField: UITextField!
    @IBOutlet weak var learningDomainPicker: UIPickerView!
    @IBOutlet weak var domainCategoryPicker: UIPickerView!
    @IBOutlet weak var actionWordCategoryPicker: UIPickerView!
    @IBOutlet weak var actionWordPicker: UIPickerView!
    
    // MARK: - IBAction
    @IBAction func doneActionClicked(_ sender: UIBarButtonItem) {
        
        // Saving to Instructor Object
        saveToPerformanceObject()
        
        // Updating Performance String
        performanceString = actionWordTextField.text!
        
        // Saving Performance Object
        savePerformanceDelegate.savePerformanceObject(self.performanceObject!, self.performanceString)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Audience PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
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
    
    // Method to set delegates for the Audience picker.
    fileprivate func onSetPickerViewDelegates() {
        learningDomainPicker.dataSource = self
        learningDomainPicker.delegate = self
        learningDomainPicker.removeFromSuperview()
        
        domainCategoryPicker.dataSource = self
        domainCategoryPicker.delegate = self
        domainCategoryPicker.removeFromSuperview()
        
        actionWordCategoryPicker.dataSource = self
        actionWordCategoryPicker.delegate = self
        actionWordCategoryPicker.removeFromSuperview()
        
        actionWordPicker.dataSource = self
        actionWordPicker.delegate = self
        actionWordPicker.removeFromSuperview()
        
        learningDomainTextField.inputView = learningDomainPicker
        domainCategoryTextField.inputView = domainCategoryPicker
        actionWordCategoryTextField.inputView = actionWordCategoryPicker
        actionWordTextField.inputView = actionWordPicker
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        learningDomainTextField.delegate     = self
        domainCategoryTextField.delegate     = self
        actionWordCategoryTextField.delegate = self
        actionWordTextField.delegate         = self
        
        // Setting TextViews Keyboard Styles
        learningDomainTextField.keyboardType     = UIKeyboardType.asciiCapable
        domainCategoryTextField.keyboardType     = UIKeyboardType.asciiCapable
        actionWordCategoryTextField.keyboardType = UIKeyboardType.asciiCapable
        actionWordTextField.keyboardType         = UIKeyboardType.asciiCapable
    }
    
    // Method to Reset the Action Word Text Field
    fileprivate func resetActionWordTextField() {
        actionWordTextField.inputView = nil
        actionWordTextField.text = ""
        actionWordTextField.becomeFirstResponder()
    }
    
    fileprivate func saveToPerformanceObject() {
        // Saving to Performance Object
        performanceObject?.learningDomain = learningDomainTextField.text!
        performanceObject?.domainCategory = domainCategoryTextField.text!
        performanceObject?.actionWordCategory = actionWordCategoryTextField.text!
        performanceObject?.actionWord = actionWordTextField.text!
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        learningDomainTextField.text =      performanceObject?.learningDomain
        domainCategoryTextField.text =      performanceObject?.domainCategory
        actionWordCategoryTextField.text =  performanceObject?.actionWordCategory
        actionWordTextField.text =          performanceObject?.actionWord
    }

    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        learningDomainTextField.resignFirstResponder()
        domainCategoryTextField.resignFirstResponder()
        actionWordCategoryTextField.resignFirstResponder()
        actionWordTextField.resignFirstResponder()
        learningDomainPicker.resignFirstResponder()
        domainCategoryPicker.resignFirstResponder()
        actionWordCategoryPicker.resignFirstResponder()
        actionWordPicker?.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case learningDomainTextField:       domainCategoryTextField.becomeFirstResponder(); break;
            case domainCategoryTextField:       actionWordCategoryTextField.becomeFirstResponder(); break;
            case actionWordCategoryTextField:   actionWordTextField.becomeFirstResponder(); break;
            case actionWordTextField:           actionWordTextField.resignFirstResponder(); break;
            default: break;
        }
        return true
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == learningDomainPicker) {
            learningDomainTextField.text = learningDomainDefault[row]
            learningDomainTextField.resignFirstResponder()
            domainCategoryTextField.becomeFirstResponder()
        } else if (pickerView == domainCategoryPicker) {
            domainCategoryTextField.text = performanceLogic.fetchDomainCategoryList(learningDomainName: learningDomainTextField.text!)[row]
            domainCategoryTextField.resignFirstResponder()
            actionWordCategoryTextField.becomeFirstResponder()
        } else if (pickerView == actionWordCategoryPicker) {
            actionWordCategoryTextField.text = performanceLogic.fetchActionWordCategoryList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!)[row]
            actionWordCategoryTextField.resignFirstResponder()
            if(actionWordTextField.inputView == nil) {
                actionWordTextField.inputView = actionWordPicker
            }
            actionWordTextField.becomeFirstResponder()
        }else if (pickerView == actionWordPicker) {
            actionWordTextField.text = performanceLogic.fetchActionWordList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!, actionWordCategory: actionWordCategoryTextField.text!)[row]
            actionWordTextField.resignFirstResponder()
            if(actionWordTextField.text! == "--Other--") {
                resetActionWordTextField()
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == learningDomainPicker) {
            return learningDomainDefault.count
        } else if (pickerView == domainCategoryPicker) {
            return performanceLogic.fetchDomainCategoryList(learningDomainName: learningDomainTextField.text!).count
        } else if (pickerView == actionWordCategoryPicker) {
            return performanceLogic.fetchActionWordCategoryList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!).count
        } else if (pickerView == actionWordPicker) {
            return performanceLogic.fetchActionWordList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!, actionWordCategory: actionWordCategoryTextField.text!).count
        } else { return 0 }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == learningDomainPicker) {
            return learningDomainDefault[row]
        } else if (pickerView == domainCategoryPicker) {
            return performanceLogic.fetchDomainCategoryList(learningDomainName: learningDomainTextField.text!)[row]
        } else if (pickerView == actionWordCategoryPicker) {
            return performanceLogic.fetchActionWordCategoryList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!)[row]
        } else if (pickerView == actionWordPicker) {
            return performanceLogic.fetchActionWordList(learningDomainName: learningDomainTextField.text!, domainCategoryName: domainCategoryTextField.text!, actionWordCategory: actionWordCategoryTextField.text!)[row]
        } else { return "" }
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
