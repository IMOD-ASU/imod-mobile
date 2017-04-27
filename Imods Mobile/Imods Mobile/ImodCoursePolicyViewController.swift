//
//  ImodCoursePolicyViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodCoursePolicyViewController: UIViewController, UITextFieldDelegate,
                                        UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var gradingProcedureTextField: UITextField!
    @IBOutlet weak var attendanceAndTardinessTextField: UITextView!
    @IBOutlet weak var classParticipationTextField: UITextView!
    @IBOutlet weak var professionalConductTextField: UITextView!
    @IBOutlet weak var missedExamsTextField: UITextView!
    @IBOutlet weak var missedAssignmentTextField: UITextView!
    @IBOutlet weak var gradingProcedurePicker: UIPickerView!
    
    // MARK: - IBActions
    
    @IBAction func restoreDefaultAction(_ sender: UIButton) {
        switch (sender.tag) {
            case 0: attendanceAndTardinessTextField.text    = attendanceAndTardinessDefault; break;
            case 1: classParticipationTextField.text        = classParticipationDefault; break;
            case 2: professionalConductTextField.text       = professionalConductDefault; break;
            case 3: missedExamsTextField.text               = missedExamsDefault; break;
            case 4: missedAssignmentTextField.text          = missedAssignmentsDefault; break;
            default: break;
        }
    }
    
    @IBAction func saveCourseAction(_ sender: Any) {
        // Saving to Course Object
        saveToCourseObject()
        
        // Calling the Save Delegate
        saveDelegate.saveCourseObject(self.courseObject!)
        
        // Pop to Previous View Controller
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Audience PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
        
        // Update Default Setting of Audience PickerView.
        gradingProcedurePicker.selectRow((courseObject?.gradingProcedure)!, inComponent: 0, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods

    fileprivate func onSetPickerViewDelegates() {
        gradingProcedurePicker.dataSource = self
        gradingProcedurePicker.delegate = self
        gradingProcedurePicker.removeFromSuperview()
        gradingProcedureTextField.inputView = gradingProcedurePicker
        
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        gradingProcedureTextField.delegate = self
        
        // Setting TextViews Keyboard Styles
        gradingProcedureTextField.keyboardType       = UIKeyboardType.asciiCapable
        attendanceAndTardinessTextField.keyboardType = UIKeyboardType.asciiCapable
        classParticipationTextField.keyboardType     = UIKeyboardType.asciiCapable
        professionalConductTextField.keyboardType    = UIKeyboardType.asciiCapable
        missedExamsTextField.keyboardType            = UIKeyboardType.asciiCapable
        missedAssignmentTextField.keyboardType       = UIKeyboardType.asciiCapable
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        gradingProcedureTextField.text          = gradingProcedureList[(courseObject?.gradingProcedure)!]
        attendanceAndTardinessTextField.text    = courseObject?.attendanceAndTardiness
        classParticipationTextField.text        = courseObject?.classParticipation
        professionalConductTextField.text       = courseObject?.professionalConduct
        missedExamsTextField.text               = courseObject?.missedOrMakeUpExams
        missedAssignmentTextField.text          = courseObject?.missedAssignments
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToCourseObject() {
        // Saving to Course Object
        
        courseObject?.gradingProcedure          = gradingProcedureList.index(of: gradingProcedureTextField.text!)!
        courseObject?.attendanceAndTardiness    = attendanceAndTardinessTextField.text
        courseObject?.classParticipation        = classParticipationTextField.text
        courseObject?.professionalConduct       = professionalConductTextField.text
        courseObject?.missedOrMakeUpExams       = missedExamsTextField.text
        courseObject?.missedAssignments         = missedAssignmentTextField.text
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gradingProcedureTextField.resignFirstResponder()
        attendanceAndTardinessTextField.resignFirstResponder()
        classParticipationTextField.resignFirstResponder()
        professionalConductTextField.resignFirstResponder()
        missedExamsTextField.resignFirstResponder()
        missedAssignmentTextField.resignFirstResponder()
        gradingProcedurePicker.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case gradingProcedureTextField:         attendanceAndTardinessTextField.becomeFirstResponder(); break;
            case attendanceAndTardinessTextField:   classParticipationTextField.becomeFirstResponder(); break;
            case classParticipationTextField:       professionalConductTextField.becomeFirstResponder(); break;
            case professionalConductTextField:      missedExamsTextField.becomeFirstResponder(); break;
            case missedExamsTextField:              missedAssignmentTextField.becomeFirstResponder(); break;
            case missedAssignmentTextField:         missedAssignmentTextField.becomeFirstResponder(); break;
            default: break;
        }
        return true
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gradingProcedureTextField.text = gradingProcedureList[row]
        gradingProcedurePicker.resignFirstResponder()
        attendanceAndTardinessTextField.becomeFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradingProcedureList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradingProcedureList[row]
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
