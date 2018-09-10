//
//  RequestItemViewController.swift
//  NibbleList
//
//  Created by Herman Kwan on 1/31/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

var requestedItems = [String]()

class RequestItemViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButtonState: UIButton!
    
    private var tapGesture = UIGestureRecognizer()
    
    var navigationBarAppearance = UINavigationBar.appearance()

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        requestedItems.append(textField.text!)
        print(requestedItems)
        
        textField.resignFirstResponder()
        let alert = UIAlertController(title: "Sent!", message: "We have received your request: \"\(textField.text!)\"", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        textField.text = ""
        sendButtonState.isEnabled = false
    }
    
    // Tracks the current textField's state and enable/disables sendButton
    @IBAction func textFieldAction(_ sender: Any) {
        if textField.text?.isEmpty == false {
            sendButtonState.isEnabled = true
        } else {
            sendButtonState.isEnabled = false
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(requestedItems)
        navigationBarAppearance.barTintColor = UIColor(red: 187/255.0, green: 238/255.0, blue: 255/255, alpha: 1.0)
        
        view.isUserInteractionEnabled = true
        
        textField.delegate = self
        sendButtonState.isEnabled = false
       
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewControllerTapped))
        view.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Configuring textField's done button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // When textField is first pressed
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            sendButtonState.isEnabled = true
        } else {
            sendButtonState.isEnabled = false
        }
    }
    
    //Right when textField is done editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            sendButtonState.isEnabled = true
        } else {
            sendButtonState.isEnabled = false
        }
    }
    
    
    // Gesture Recognizer method for resigning the textField and keyboard
    @objc func viewControllerTapped(_ sender: UIGestureRecognizer) {
        textField.resignFirstResponder()
        print("viewController got tapped!")
    }
    
    // Gesture Recognizer method tapping which background
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == view {
            return true
        }
        return false
    }
}
