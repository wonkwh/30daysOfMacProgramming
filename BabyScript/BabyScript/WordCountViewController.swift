//
//  WordCountViewController.swift
//  BabyScript
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Cocoa

class WordCountViewController: NSViewController {

    @objc dynamic var wordCount = 0
    @objc dynamic var paragraphCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func dismissWordCountWindow(_ sender: NSButton) {
        NSApplication.shared.stopModal()
    }
}
