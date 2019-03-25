//
//  PreferencesViewController.swift
//  BMI Calculator
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var metricRadio: NSButton!
    
    @IBOutlet weak var imperialRadio: NSButton!
    
    var selectedRadio: NSButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedRadio = metricRadio
        loadSettings()
    }
    
    func loadSettings() {
        if let preferredSystem = UserDefaults.standard.value(forKey: "measurementSystem") as? String {
            if  preferredSystem == "metric" {
                metricRadio.state = .on
                imperialRadio.state = .off
                selectedRadio = metricRadio
            } else {
                metricRadio.state = .off
                imperialRadio.state = .on
                selectedRadio = imperialRadio
            }
        }
    }

    @IBAction func changeMeasurementSystem(_ sender: Any) {
        if let radio = sender as? NSButton, let selectedRadio = selectedRadio {
            if radio != selectedRadio {
                if radio == metricRadio {
                    UserDefaults.standard.setValue("metric", forKey: "measurementSystem")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didChangeMeasurementSystem"), object: "metric")
                    
                } else {
                    UserDefaults.standard.setValue("imperial", forKey: "measurementSystem")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didChangeMeasurementSystem"), object: "imperial")
                }
                
                self.selectedRadio = radio
            }
        }
    }
}
