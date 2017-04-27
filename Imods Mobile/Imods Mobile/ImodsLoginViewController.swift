//
//  ViewController.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/7/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit
import CoreData

class ImodsLoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Stored Properties
    var appDelegate : AppDelegate? = nil
    var managedObjectContext : NSManagedObjectContext? = nil
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set TextField Delegates
        onSetTextFieldsDelegateAndKeyboardTypes()
        
        //Fetching AppDelegate and ManagedObjectContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Controller Private Methods
    
    // Method to set delegates for the TextFields and their KeyboardTypes.
    fileprivate func onSetTextFieldsDelegateAndKeyboardTypes() {
        // Setting TextViews Delegates to the View Controller
        username.delegate = self
        password.delegate = self
        
        // Setting TextViews Keyboard Styles
        username.keyboardType = UIKeyboardType.asciiCapable
        password.keyboardType = UIKeyboardType.asciiCapable
    }
    
    // MARK: - View Controller UITextDelegate Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case username:   password.becomeFirstResponder(); break;
            case password:   loginButton.sendActions(for: .touchUpInside); break;
            default: break;
        }
        return true
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "showMasterViewController":
                        var destViewController = segue.destination as? UINavigationController
                        let viewController = destViewController?.topViewController as? ImodsMasterViewController
                        
                        // Initialize the Master View Controller and assign values based on user input.
                        var iUserObject = ImodLoginUserHolder(username: self.username.text!, password: self.password.text!, newManagedObjectContext: self.managedObjectContext!)
                        viewController?.imodUserHolder = iUserObject
                
                default : break //Do Nothing
            }
        }
    }
}

