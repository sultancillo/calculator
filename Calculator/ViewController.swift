//
//  ViewController.swift
//  Calculator
//
//  Created by Mario Valencia on 10/12/15.
//  Copyright © 2015 The Washington Times. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userTypingNumber = false
    
    var brain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userTypingNumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userTypingNumber = true
        }
        
    }
    
    
    
    @IBAction func operate(sender: UIButton) {
        
        if userTypingNumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation){
                displayValue = result
            }
            else {
                displayValue = 0
            }
        }

    }
    

    

    
    @IBAction func enter() {
        userTypingNumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }
        else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userTypingNumber = false
        }
    }
}