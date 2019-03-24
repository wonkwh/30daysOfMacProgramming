//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var weightTextfield: NSTextField!
    
    @IBOutlet weak var heightTextfield: NSTextField!
    
    @IBOutlet weak var inchesTextfield: NSTextField!
    
    @IBOutlet weak var resultsView: NSView!
    
    @IBOutlet weak var resultsLabel: NSTextField!
    
    
    
    // MARK: - Default Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    // MARK: - IBAction Methods
    
    @IBAction func calculateBMI(_ sender: Any) {
        
    }
    
}

