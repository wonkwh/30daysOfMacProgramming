//
//  ViewController.swift
//  NSTextViewPractice
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: CustomTextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

