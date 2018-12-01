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
    
    var prefs = Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showExistingPrefs()
    }
    
    func showExistingPrefs() {
        let selectedTimeInMinutes = Int(prefs.selectedTime) / 60
        
        presetsPopup.selectItem(withTitle: "Custom")
        customTimingSlider.isEnabled = true
        
        for item in presetsPopup.itemArray {
            if item.tag == selectedTimeInMinutes {
                presetsPopup.select(item)
                customTimingSlider.isEnabled = false
                break
            }
        }
        
        customTimingSlider.integerValue = selectedTimeInMinutes
        showSliderValueAsText()
    }
    
    func saveNewPrefs() {
        prefs.selectedTime = customTimingSlider.doubleValue * 60
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PrefsChanged"),
                                        object: nil)
    }
    
    func showSliderValueAsText() {
        let newTimerDuration = customTimingSlider.integerValue
        let minutesDescription = (newTimerDuration == 1) ? "minutes" : "minutes"
        customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
    }

    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
        print("poppup value: \(sender.selectedItem?.tag ?? 0)")
        
        if sender.selectedItem?.title == "Custom" {
            customTimingSlider.isEnabled = true
            return
        }
        
        let newTimerDuration = sender.selectedTag()
        customTimingSlider.integerValue = newTimerDuration
        showSliderValueAsText()
        customTimingSlider.isEnabled = false
    }
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        showSliderValueAsText()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        view.window?.close()
    }
    
    @IBAction func OkButtonClicked(_ sender: Any) {
        saveNewPrefs()
        view.window?.close()
    }
}
