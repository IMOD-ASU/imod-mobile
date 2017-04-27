//
//  ImodCourseDetailsViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/12/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

protocol SaveCourseObjectViewControllerDelegate {
    func saveCourseObject(_ courseObject: ImodCourse)
}

class ImodCourseDetailsViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var courseTitleTextField: UITextField!
    @IBOutlet weak var courseNumberTextField: UITextField!
    @IBOutlet weak var courseUrlTextField: UITextField!
    @IBOutlet weak var classroomLocationTextField: UITextField!
    @IBOutlet weak var semesterTextField: UITextField!
    
    // MARK: - IBActions
    
    @IBAction func saveCourseDetailsInfo(_ sender: Any) {
        if((self.courseTitleTextField.text?.isEmpty)! || (self.courseNumberTextField.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Course Title and Course Number cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            // Saving to Course Object
            saveToCourseObject()
            
            // Calling the Save Delegate
            saveDelegate.saveCourseObject(self.courseObject!)
            
            // Pop to Previous View Controller
            self.navigationController?.popViewController(animated: true)
        }
    }

    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting the TextField Keyboard Delegates to the View Controller
        self.onSetTextDelegateAndKeyboardTypes()
        
        // Setting the Values for the UI
        if(courseObject != nil) {
            updateUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ViewController Private Methods
    
    fileprivate func updateUI() {
        
        // Updating the Text Fields as loaded.
        courseTitleTextField.text = courseObject?.courseTitle
        courseNumberTextField.text = courseObject?.courseNumber
        courseUrlTextField.text = courseObject?.courseURL
        classroomLocationTextField.text = courseObject?.classroomLocation
        semesterTextField.text = courseObject?.semester
    }
    
    fileprivate func saveToCourseObject() {
        
        // Saving to Course Object
        courseObject?.courseTitle = courseTitleTextField.text!
        courseObject?.courseNumber = courseNumberTextField.text!
        courseObject?.courseURL = courseUrlTextField.text!
        courseObject?.classroomLocation = classroomLocationTextField.text!
        courseObject?.semester = semesterTextField.text!
    }
    
    fileprivate func onSetTextDelegateAndKeyboardTypes() {
        
        // Setting the Delegates to Self
        courseTitleTextField.delegate = self
        courseNumberTextField.delegate = self
        courseUrlTextField.delegate = self
        classroomLocationTextField.delegate = self
        semesterTextField.delegate = self
        
        // Setting Text Fields Keyboard Type
        courseTitleTextField.keyboardType = UIKeyboardType.asciiCapable
        courseNumberTextField.keyboardType = UIKeyboardType.asciiCapable
        courseUrlTextField.keyboardType = UIKeyboardType.URL
        classroomLocationTextField.keyboardType = UIKeyboardType.asciiCapable
        semesterTextField.keyboardType = UIKeyboardType.asciiCapable
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        courseTitleTextField.resignFirstResponder()
        courseNumberTextField.resignFirstResponder()
        courseUrlTextField.resignFirstResponder()
        classroomLocationTextField.resignFirstResponder()
        semesterTextField.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case courseTitleTextField:          courseNumberTextField.becomeFirstResponder(); break;
            case courseNumberTextField:         courseUrlTextField.becomeFirstResponder(); break;
            case courseUrlTextField:            classroomLocationTextField.becomeFirstResponder(); break;
            case classroomLocationTextField:    semesterTextField.becomeFirstResponder(); break;
            case semesterTextField:             semesterTextField.resignFirstResponder(); break;
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
