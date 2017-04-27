//
//  ImodCourseDescriptionViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodCourseDescriptionViewController: UIViewController, UITextFieldDelegate,
                                            UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var overviewTextField: UITextView!
    @IBOutlet weak var subjectAreaTextField: UITextField!
    @IBOutlet weak var audienceTextField: UITextField!
    @IBOutlet weak var creditHoursTextField: UITextField!
    @IBOutlet weak var timeRatioTextField: UITextField!
    @IBOutlet weak var numberOfSeatsTextField: UITextField!
    @IBOutlet weak var audiencePicker: UIPickerView!
    @IBOutlet weak var creditHoursStepper: UIStepper!
    @IBOutlet weak var numberOfSeatsStepper: UIStepper!
    
    // MARK: - IBActions
    
    @IBAction func saveCourseDetailsInfo(_ sender: Any) {
        if((self.subjectAreaTextField.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Subject Area cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
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
    
    @IBAction func creditHoursStepper(_ sender: Any) {
        creditHoursTextField.text = Int((sender as! UIStepper).value).description
    }
    
    
    @IBAction func numberOfSeatsStepper(_ sender: Any) {
        numberOfSeatsTextField.text = Int((sender as! UIStepper).value).description
    }
    
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Audience PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
        
        // Set the Stepper Values
        onSetStepperValues()
        
        // Update Default Setting of Audience PickerView.
        audiencePicker.selectRow((courseObject?.audience)!, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    // Method to set delegates for the Audience picker.
    fileprivate func onSetPickerViewDelegates() {
        audiencePicker.dataSource = self
        audiencePicker.delegate = self
        audiencePicker.removeFromSuperview()
        audienceTextField.inputView = audiencePicker
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        subjectAreaTextField.delegate = self
        audienceTextField.delegate = self
        creditHoursTextField.delegate = self
        timeRatioTextField.delegate = self
        numberOfSeatsTextField.delegate = self
        
        // Setting TextViews Keyboard Styles
        subjectAreaTextField.keyboardType = UIKeyboardType.asciiCapable
        audienceTextField.keyboardType = UIKeyboardType.asciiCapable
        creditHoursTextField.keyboardType = UIKeyboardType.numberPad
        timeRatioTextField.keyboardType = UIKeyboardType.asciiCapable
        numberOfSeatsTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        overviewTextField.text = courseObject?.overview
        subjectAreaTextField.text = courseObject?.subjectArea
        audienceTextField.text = audienceList[(courseObject?.audience)!]
        creditHoursTextField.text = String(describing: courseObject!.creditHours)
        timeRatioTextField.text = courseObject?.timeRatio
        numberOfSeatsTextField.text =  String(describing: courseObject!.numberOfSeats)
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToCourseObject() {
        // Saving to Course Object
        courseObject?.overview          = overviewTextField.text!
        courseObject?.subjectArea       = subjectAreaTextField.text!
        courseObject?.audience          = audienceList.index(of: audienceTextField.text!)!
        courseObject?.creditHours       = Int(creditHoursTextField.text!)!
        courseObject?.timeRatio         = timeRatioTextField.text!
        courseObject?.numberOfSeats     = Int(numberOfSeatsTextField.text!)!
    }
    
    // Method to set initial Stepper Values
    fileprivate func onSetStepperValues()  {
        creditHoursStepper.value = Double((courseObject?.creditHours)!)
        numberOfSeatsStepper.value = Double((courseObject?.numberOfSeats)!)
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        overviewTextField.resignFirstResponder()
        subjectAreaTextField.resignFirstResponder()
        audienceTextField.resignFirstResponder()
        creditHoursTextField.resignFirstResponder()
        timeRatioTextField.resignFirstResponder()
        numberOfSeatsTextField.resignFirstResponder()
        audiencePicker.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case overviewTextField:         subjectAreaTextField.becomeFirstResponder(); break;
            case subjectAreaTextField:      audienceTextField.becomeFirstResponder(); break;
            case audienceTextField:         creditHoursTextField.becomeFirstResponder(); break;
            case creditHoursTextField:      timeRatioTextField.becomeFirstResponder(); break;
            case timeRatioTextField:        numberOfSeatsTextField.becomeFirstResponder(); break;
            case numberOfSeatsTextField:    numberOfSeatsTextField.becomeFirstResponder(); break;
            default: break;
        }
        return true
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        audienceTextField.text = audienceList[row]
        audienceTextField.resignFirstResponder()
        creditHoursTextField.becomeFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return audienceList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return audienceList[row]
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
