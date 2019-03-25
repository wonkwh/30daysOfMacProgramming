//
//  AppDelegate.swift
//  BMI Calculator
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var preferencesWindowController: NSWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if UserDefaults.standard.value(forKey: "measurementSystem") == nil {
            UserDefaults.standard.set("metric", forKey: "measurementSystem")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func showPrefrences(_ sender: Any) {
        if preferencesWindowController == nil {
            let storyboard = NSStoryboard(name: "Preferences", bundle: nil)
            if let windowController = storyboard.instantiateInitialController() as? NSWindowController {
                preferencesWindowController = windowController
            }
        }
        
        if let windowController = preferencesWindowController {
            windowController.showWindow(nil)
        }
    }

}

