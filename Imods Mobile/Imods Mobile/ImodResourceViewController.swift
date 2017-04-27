//
//  ImodResourceViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/13/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveResourceViewControllerDelegate {
    func saveResourceObject(_ resourceObject: ImodResource, _ addResource: Bool)
}

class ImodResourceViewController: UIViewController, UITextFieldDelegate,
                                        UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Stored Properties
    var resourceObject : ImodResource? = nil
    var saveResourceDelegate : SaveResourceViewControllerDelegate!
    var addResource : Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var resourceTitleTextField: UITextField!
    @IBOutlet weak var resourceDescriptionTextField: UITextField!
    @IBOutlet weak var resourceTypeTextField: UITextField!
    @IBOutlet weak var resourceTypePicker: UIPickerView!
    
    // MARK: - IBActions
    @IBAction func saveActionClicked(_ sender: UIBarButtonItem) {
        
        // Saving to Resource Object
        saveToResourceObject()
        
        // Adding Instructor Object to Instructors List
        saveResourceDelegate.saveResourceObject(resourceObject!, addResource)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting Instructor Role PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
        
        // Update Default Setting of Role PickerView.
        resourceTypePicker.selectRow((resourceObject?.resourceType)!, inComponent: 0, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    fileprivate func onSetPickerViewDelegates() {
        resourceTypePicker.dataSource = self
        resourceTypePicker.delegate = self
        resourceTypePicker.removeFromSuperview()
        resourceTypeTextField.inputView = resourceTypePicker
        
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        resourceTitleTextField.delegate       = self
        resourceDescriptionTextField.delegate = self
        resourceTypeTextField.delegate        = self
        
        
        // Setting TextViews Keyboard Styles
        resourceTitleTextField.keyboardType       = UIKeyboardType.asciiCapable
        resourceDescriptionTextField.keyboardType = UIKeyboardType.asciiCapable
        resourceTypeTextField.keyboardType        = UIKeyboardType.asciiCapable
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        resourceTitleTextField.text        = resourceObject?.resourceTitle
        resourceDescriptionTextField.text  = resourceObject?.resourceDescription
        resourceTypeTextField.text         = resourcesListDefault[(resourceObject?.resourceType)!]
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToResourceObject() {
        // Saving to Instructor Object
        resourceObject?.resourceTitle           = resourceTitleTextField.text!
        resourceObject?.resourceDescription     = resourceDescriptionTextField.text!
        resourceObject?.resourceType            = resourcesListDefault.index(of: resourceTypeTextField.text!)!
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resourceTitleTextField.resignFirstResponder()
        resourceDescriptionTextField.resignFirstResponder()
        resourceTypeTextField.resignFirstResponder()
        resourceTypePicker.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case resourceTitleTextField:        resourceDescriptionTextField.becomeFirstResponder(); break;
            case resourceDescriptionTextField:  resourceTypeTextField.becomeFirstResponder(); break;
            case resourceTypeTextField:         resourceTypeTextField.becomeFirstResponder(); break;
            default: break;
        }
        return true
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resourceTypeTextField.text = resourcesListDefault[row]
        resourceTypeTextField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return resourcesListDefault.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return resourcesListDefault[row]
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
