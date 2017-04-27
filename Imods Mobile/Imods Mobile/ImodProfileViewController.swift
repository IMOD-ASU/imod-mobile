//
//  ImodProfileViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/20/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveImodCourseDelegate {
    func saveImodCourseObject(_ imodCourseObject: ImodCourse)
}

class ImodProfileViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Stored Properties
    var imodCourse : ImodCourse? = ImodCourse()
    var saveImodCourseDelegate : SaveImodCourseDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var imodProfileNameTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func saveCourseObject(_ sender: UIBarButtonItem) {
        if((self.imodProfileNameTextField.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Profile Name should not be Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            // Saving to Instructor Object
            saveToCourseObject()
            
            // Adding Instructor Object to Instructors List
            saveImodCourseDelegate.saveImodCourseObject(self.imodCourse!)
            
            // Pop to Previous View Controller
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        imodProfileNameTextField.delegate = self
        
        // Setting TextViews Keyboard Styles
        imodProfileNameTextField.keyboardType = UIKeyboardType.asciiCapable
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToCourseObject() {
        // Saving to Instructor Object
        imodCourse?.profileName = imodProfileNameTextField.text!
    }

    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        imodProfileNameTextField.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case imodProfileNameTextField:   imodProfileNameTextField.resignFirstResponder(); break;
            default: break;
        }
        return true
    }
}
