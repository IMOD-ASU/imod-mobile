//
//  ImodScheduleViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/14/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class ImodScheduleViewController: UITableViewController, UITextFieldDelegate,
                                        UIPickerViewDelegate, UIPickerViewDataSource, SaveRepeatsOnViewControllerDelegate {

    // MARK: - Save KnowledgeDimensions Object
    func saveRepeatsOnObject(_ repeatsOnObject: [String]) {
        self.courseObject?.repeatsOn = repeatsOnObject
    }
    
    // MARK: - Stored Properties
    var courseObject : ImodCourse? = nil
    var saveDelegate : SaveCourseObjectViewControllerDelegate!
    
    let dateFormat = "MMM d, yyyy hh:mm:ss a"
    
    // MARK: - IBOutlets
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var repeatsTextField: UITextField!
    @IBOutlet weak var repeatsEveryTextField: UITextField!
    @IBOutlet weak var repeatsEveryLabel: UITextView!
    @IBOutlet weak var repeatsPicker: UIPickerView!
    @IBOutlet weak var repeatsEveryPicker: UIPickerView!
    @IBOutlet weak var repeatsOnCell: UITableViewCell!
    
    // MARK: - IBActions
    @IBAction func saveCourseInfo(_ sender: Any) {
        if((self.startDateTextField.text?.isEmpty)! || (self.endDateTextField.text?.isEmpty)! || (self.startTimeTextField.text?.isEmpty)! || (self.endTimeTextField.text?.isEmpty)!) {
            let alert = UIAlertController(title: "Message to User", message: "Start Date, End Date, Start Time and End Time should not be Empty", preferredStyle: UIAlertControllerStyle.alert)
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
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the Tableview Cell Seperator Style
        self.tableView.separatorStyle = .none
        
        // Setting Audience PickerView Data Source and Delegates
        onSetPickerViewDelegates()
        
        // Setting TextViews Delegates to the View Controller
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        // Update the UI Elements from the Course Object
        updateUI()
        
        // Set Repeats Conditions based on UI
        setRepeatsCondition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Controller Private Methods
    
    // Method to set delegates for the Audience picker.
    fileprivate func onSetPickerViewDelegates() {
        repeatsPicker.dataSource = self
        repeatsPicker.delegate = self
        repeatsPicker.removeFromSuperview()
        repeatsTextField.inputView = repeatsPicker
        
        repeatsEveryPicker.dataSource = self
        repeatsEveryPicker.delegate = self
        repeatsEveryPicker.removeFromSuperview()
        repeatsEveryTextField.inputView = repeatsEveryPicker
    }
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        startDateTextField.delegate     = self
        endDateTextField.delegate       = self
        startTimeTextField.delegate     = self
        endTimeTextField.delegate       = self
        repeatsTextField.delegate       = self
        repeatsEveryTextField.delegate  = self
        
        // Setting TextViews Keyboard Styles
        startDateTextField.keyboardType     = UIKeyboardType.asciiCapable
        endDateTextField.keyboardType       = UIKeyboardType.asciiCapable
        startTimeTextField.keyboardType     = UIKeyboardType.asciiCapable
        endTimeTextField.keyboardType       = UIKeyboardType.asciiCapable
        repeatsTextField.keyboardType       = UIKeyboardType.asciiCapable
        repeatsEveryTextField.keyboardType  = UIKeyboardType.asciiCapable
    }
    
    // Method to update UI elements
    fileprivate func updateUI() {
        // Updating Text Fields
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        startDateTextField.text = dateFormatter.string(from: (courseObject?.startDate)!)
        endDateTextField.text = dateFormatter.string(from: (courseObject?.endDate)!)
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        startTimeTextField.text = dateFormatter.string(from: (courseObject?.startDate)!)
        endTimeTextField.text = dateFormatter.string(from: (courseObject?.endDate)!)
        
        repeatsTextField.text       = repeatsList[(courseObject?.repeats)!]
        repeatsEveryTextField.text  = repeatsEveryList[(courseObject?.repeatsEvery)!]
    }
    
    // Method to set Repeats, Repeats Every and Repeats On Text Fields based on certain conditions
    fileprivate func setRepeatsCondition() {
        if repeatsTextField.text! == "Daily" {
            self.repeatsEveryTextField.isHidden = false
            self.repeatsEveryLabel.text = "Days"
            self.courseObject?.repeatsOn.removeAll()
            repeatsOnCell.isHidden = true
        } else if repeatsTextField.text! == "Weekly" {
            self.repeatsEveryTextField.isHidden = false
            self.repeatsEveryLabel.text = "Weeks"
            repeatsOnCell.isHidden = false
        } else {
            self.repeatsEveryTextField.isHidden = true
            self.repeatsEveryLabel.text = ""
            self.courseObject?.repeatsOn.removeAll()
            repeatsOnCell.isHidden = true
        }
    }
    
    // Method to save Course Details to Object
    fileprivate func saveToCourseObject() {
        // Saving to Course Object
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        courseObject?.startDate     = dateFormatter.date(from: startDateTextField.text! + " " + startTimeTextField.text!)!
        courseObject?.endDate       = dateFormatter.date(from: endDateTextField.text! + " " + endTimeTextField.text!)!
        courseObject?.repeats       = repeatsList.index(of: repeatsTextField.text!)!
        courseObject?.repeatsEvery  = repeatsEveryList.index(of: repeatsEveryTextField.text!)!
    }
    
    // Method to Change Date Picker Start Date and Time
    @objc fileprivate func datePickerChangedStartDateAndTime(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        startDateTextField.text = dateFormatter.string(from: sender.date)
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        startTimeTextField.text = dateFormatter.string(from: sender.date)
    }
    
    // Method to Change Date Picker End Date and Time
    @objc fileprivate func datePickerChangedEndDateAndTime(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        endDateTextField.text = dateFormatter.string(from: sender.date)
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        endTimeTextField.text = dateFormatter.string(from: sender.date)
    }
    
    // MARK: - UIView Overriden Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
        startTimeTextField.resignFirstResponder()
        endTimeTextField.resignFirstResponder()
        repeatsTextField.resignFirstResponder()
        repeatsEveryTextField.resignFirstResponder()
        repeatsPicker.resignFirstResponder()
        repeatsEveryPicker.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case startDateTextField:    endDateTextField.becomeFirstResponder(); break;
        case endDateTextField:      startTimeTextField.becomeFirstResponder(); break;
        case startTimeTextField:    endTimeTextField.becomeFirstResponder(); break;
        case endTimeTextField:      repeatsTextField.becomeFirstResponder(); break;
        case repeatsTextField:      repeatsTextField.resignFirstResponder(); break;
        case repeatsEveryTextField: repeatsEveryTextField.resignFirstResponder(); break;
        default: break;
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == startTimeTextField ||
            textField == startDateTextField) {
            
            // Initialize the Date Formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            
            // Initialize the Date Picker with the Date in Text Field before use.
            let datePicker = UIDatePicker()
            datePicker.date = dateFormatter.date(from: startDateTextField.text! + " " + startTimeTextField.text!)!
            datePicker.datePickerMode = .dateAndTime
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChangedStartDateAndTime(sender:)), for: .valueChanged)
        }
        else if (textField == endTimeTextField ||
            textField == endDateTextField) {
            
            // Initialize the Date Formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            
            // Initialize the Date Picker with the Date in Text Field before use.
            let datePicker = UIDatePicker()
            datePicker.date = dateFormatter.date(from: endDateTextField.text! + " " + endTimeTextField.text!)!
            datePicker.datePickerMode = .dateAndTime
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChangedEndDateAndTime(sender:)), for: .valueChanged)
        }
    }
    
    // MARK: - UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == repeatsPicker) {
            repeatsTextField.text = repeatsList[row]
            repeatsTextField.resignFirstResponder()
            setRepeatsCondition()
        } else {
            repeatsEveryTextField.text = repeatsEveryList[row]
            repeatsEveryTextField.resignFirstResponder()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == repeatsPicker) {
            return repeatsList.count
        } else {
            return repeatsEveryList.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == repeatsPicker) {
            return repeatsList[row]
        } else {
            return repeatsEveryList[row]
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "showRepeatsOn":
                    if let mdvc = segue.destination as? ImodRepeatsOnViewController {
                        mdvc.repeatsOn = self.courseObject?.repeatsOn
                        mdvc.saveRepeatsOnDelegate = self
                    }
                    break;
            
                default : break //Do Nothing
            }
        }
    }
}
