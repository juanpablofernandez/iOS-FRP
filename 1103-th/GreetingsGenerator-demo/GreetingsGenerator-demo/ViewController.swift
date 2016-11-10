
//
//  ViewController.swift
//  DataBindings-demo
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var greetingsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var greetingButtons: [UIButton]!
    
    var name: String?
    var segmentSelected: state?
    var textGreeting: String?
    var buttonGreeting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        greetingsTextField.delegate = self
        name = nameTextField.text
        textGreeting = "Hello"
        buttonGreeting = "Hello"
        segmentSelected = .button
        nameTextField.addTarget(self, action: #selector(self.nameTextFieldDidChange), for: UIControlEvents.editingChanged)
        greetingsTextField.addTarget(self, action: #selector(self.greetingTextFieldDidChange), for: UIControlEvents.editingChanged)
    }
    @IBAction func stateChanged(_ sender: UISegmentedControl) {
        let button = sender.selectedSegmentIndex
        switch button {
        case 0:
            segmentSelected = .button
            setGreeting()
        case 1:
            segmentSelected = .text
            setGreeting()
        default: break
        }
    }
    func nameTextFieldDidChange(textField: UITextField) {
        if textField.text != nil {
            name = textField.text
            setGreeting()
        }
    }
    func greetingTextFieldDidChange(textField: UITextField) {
        if textField.text != nil {
            textGreeting = textField.text
            setGreeting()
        }
    }
    @IBAction func greetingsButtonPressed(_ sender: UIButton) {
        let button = sender.titleLabel?.text
        buttonGreeting = button!
        setGreeting()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        greetingsTextField.resignFirstResponder()
        textGreeting = greetingsTextField.text
        name = nameTextField.text
        setGreeting()
        return true
    }
    func setGreeting() {
        if segmentSelected == .button {
            greetingsLabel.text = "\(buttonGreeting!), \(name!)"
        } else {
            greetingsLabel.text = "\(textGreeting!), \(name!)"
        }
    }
    enum state {
        case button
        case text
    }
}
