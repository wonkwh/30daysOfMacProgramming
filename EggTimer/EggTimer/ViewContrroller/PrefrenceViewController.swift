//
//  PrefrenceViewController.swift
//  EggTimer
//
//  Created by wonkwh on 28/11/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import Cocoa

class PrefrenceViewController: NSViewController {

    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customTextField: NSTextField!
    @IBOutlet weak var customTimingSlider: NSSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
        print("poppup value: \(sender.selectedItem?.tag ?? 0)")
    }
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        print("slider value:\(sender.stringValue)")
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func OkButtonClicked(_ sender: Any) {
        
    }
}
