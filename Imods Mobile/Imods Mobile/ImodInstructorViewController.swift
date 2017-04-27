//
//  ImodInstructorViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveInstructorObjectViewControllerDelegate {
    func saveInstructorObject(_ instructorObject: SInstructor, _ addInstructor: Bool)
}

class ImodInstructorViewController: UIViewController, UITextFieldDelegate,
                                        UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Stored Properties
    var instructorObject : SInstructor? = nil
    var saveInstructorDelegate : SaveInstructorObjectViewControllerDelegate!
    var addInstructor : Bool = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var officeHoursTextField: UITextField!
    @IBOutlet weak var webPageTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var officeLocationTextField: UITextField!
    @IBOutlet weak var instructorRolePicker: UIPickerView!
    
    // MARK: - IBActions
    @IBAction func saveInstructorDetailsInfo(_ sender: UIBarButtonItem) {
        // Saving to Instructor Object
        saveToInstructorObject()
        
        // Adding Instructor Object to Instructors List
        saveInstructorDelegate.saveInstructorObject(instructorObject!, addInstructor)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Instructor Role PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
        
        // Update Default Setting of Role PickerView.
        instructorRolePicker.selectRow((instructorObject?.role)!, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    fileprivate func onSetPickerViewDelegates() {
        instructorRolePicker.dataSource = self
        instructorRolePicker.delegate = self
        instructorRolePicker.removeFromSuperview()
        roleTextField.inputView = instructorRolePicker
        
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        firstNameTextField.delegate     = self
        lastNameTextField.delegate      = self
        emailTextField.delegate         = self
        officeHoursTextField.delegate   = self
        webPageTextField.delegate       = self
        roleTextField.delegate          = self
        officeLocationTextField.delegate = self
        
        // Setting TextViews Keyboard Styles
        firstNameTextField.keyboardType         = UIKeyboardType.asciiCapable
        lastNameTextField.keyboardType          = UIKeyboardType.asciiCapable
        emailTextField.keyboardType             = UIKeyboardType.emailAddress
        officeHoursTextField.keyboardType       = UIKeyboardType.asciiCapable
        webPageTextField.keyboardType           = UIKeyboardType.URL
        roleTextField.keyboardType              = UIKeyboardType.asciiCapable
        officeLocationTextField.keyboardType    = UIKeyboardType.asciiCapable
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        firstNameTextField.text         = instructorObject?.firstName
        lastNameTextField.text          = instructorObject?.lastName
        emailTextField.text             = instructorObject?.email
        officeHoursTextField.text       = instructorObject?.officeHours
        webPageTextField.text           = instructorObject?.webPage
        roleTextField.text              = instructorRoleList[(instructorObject?.role)!]
        officeLocationTextField.text    = instructorObject?.officeLocation
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToInstructorObject() {
        // Saving to Instructor Object
        instructorObject?.firstName     = firstNameTextField.text!
        instructorObject?.lastName      = lastNameTextField.text!
        instructorObject?.email         = emailTextField.text!
        instructorObject?.officeHours   = officeHoursTextField.text!
        instructorObject?.webPage       = webPageTextField.text!
        instructorObject?.role          = instructorRoleList.index(of: roleTextField.text!)!
        instructorObject?.officeLocation = officeLocationTextField.text!
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        officeHoursTextField.resignFirstResponder()
        webPageTextField.resignFirstResponder()
        roleTextField.resignFirstResponder()
        officeLocationTextField.resignFirstResponder()
//        instructorRolePicker.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case firstNameTextField:        lastNameTextField.becomeFirstResponder(); break;
            case lastNameTextField:         emailTextField.becomeFirstResponder(); break;
            case emailTextField:            officeHoursTextField.becomeFirstResponder(); break;
            case officeHoursTextField:      webPageTextField.becomeFirstResponder(); break;
            case webPageTextField:          roleTextField.becomeFirstResponder(); break;
            case roleTextField:             officeLocationTextField.becomeFirstResponder(); break;
            case officeLocationTextField:   officeLocationTextField.becomeFirstResponder(); break;
            default: break;
        }
        return true
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roleTextField.text = instructorRoleList[row]
        officeLocationTextField.becomeFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return instructorRoleList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return instructorRoleList[row]
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
