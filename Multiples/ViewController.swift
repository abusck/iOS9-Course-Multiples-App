//
//  ViewController.swift
//  Multiples
//  Copyright © 2016 Kimberly Abuschinow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:  Properties
    var multipleValue: Int = 0
    var sum: Int = 0
    var updatedSum: Int = 0
    var currentTap = 0
    var maxtaps = 20
    
    // MARK:  Outlets
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    

    // MARK:  Actions
    @IBAction func playButtonPressed(sender: UIButton) {
        
        if textField.text != nil && textField.text != "" {
            
            expressionLabel.hidden = false
            addButton.hidden = false
            playButton.hidden = true
            textField.hidden = true
            
            multipleValue = Int(textField.text!)!
            sum = multipleValue + 0
            expressionLabel.text = "\(sum) + 0 = \(sum)"
        }
    }

    @IBAction func AddButtonPressed(sender: UIButton) {
        currentTap++
        updatedSum = sum + multipleValue
        calcMultiples()
        
        if isCalcComplete() {
            restart()
        }
    }
    
    // MARK:  Functions
    func calcMultiples() {
        
        if currentTap <= maxtaps {
            expressionLabel.text = "\(sum) + \(multipleValue) = \(updatedSum)"
            sum = updatedSum
        }
    }
    
    func isCalcComplete() -> Bool {
        if currentTap >= maxtaps {
            return true
        } else {
            return false
        }
    }

    func restart() {
        maxtaps = 20
        currentTap = 0
        sum = 0
        multipleValue = 0
        updatedSum = 0
        
        expressionLabel.hidden = true
        addButton.hidden = true
        playButton.hidden = false
        textField.text = ""
        textField.hidden = false
    }

    override func viewDidLoad() {
        playButton.hidden = false
        textField.hidden = false
        addButton.hidden = true
        expressionLabel.hidden = true
    }
}

